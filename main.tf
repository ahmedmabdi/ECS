# Root module

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "sg" {
  source       = "./modules/sg"
  vpc_id       = module.vpc.vpc_id
  home_ip      = var.home_ip
  project_name = var.project_name
}

module "iam" {
  source                      = "./modules/iam"
  ecs_task_execution_role_name = "ecsExecutionRoleDemo"  
  ecs_task_role_name           = "ecsTaskRoleDemo"       
}
module "ecs" {
  source = "./modules/ecs"

  cluster_name = "ecs-umami"
  service_name = "umami-service"
  task_family  = "umami-task"

  container_name  = var.container_name
  container_image = var.container_image
  container_port  = var.container_port

  execution_role_arn = module.iam.ecs_execution_role_arn
  ecs_task_role_arn  = module.iam.ecs_task_role_arn
  database_url_arn = module.ssm.database_url_arn

  private_subnets    = module.vpc.private_subnet_ids
  security_groups    = [module.sg.ecs_sg_id]
  target_group_arn   = module.alb.target_group_arn
  ecs_sg_id          = module.sg.ecs_sg_id

  desired_count = 1
  min_count     = 1
  max_count     = 2

  task_cpu    = "256"
  task_memory = "512"

  vpc_id = module.vpc.vpc_id
  region = var.aws_region

  rds_username = var.rds_username
  rds_password = var.rds_password
  rds_db_name  = var.rds_db_name
  rds_address = module.rds.db_address
  rds_port     = module.rds.db_port
  depends_on = [ 
    module.vpc,
    module.rds,
    module.sg
   ]
}
module "alb" {
  source            = "./modules/alb"
  name              = "umami-alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.sg.alb_sg_id
  certificate_arn   = module.acm.certificate_arn
  health_check_path = "/"
  target_port       = 3000
}
module "acm" {
  source = "./modules/acm"
}
module "route53" {
  source       = "./modules/route53"
  domain_name  = var.acm_domain_name
  zone_id      = var.route53_zone_id
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}
module "cloudwatch" {
  source        = "./modules/cloudwatch"
  project_name  = "umami-ecs"
  environment   = "dev"
  aws_region    = var.aws_region
  cluster_name  = module.ecs.cluster_name
  service_name  = module.ecs.service_name
  cpu_threshold = 70
}
module "rds" {
  source                 = "./modules/rds"
  db_name                = var.rds_db_name
  username               = var.rds_username
  password               = var.rds_password
  instance_type          = var.rds_instance_type
  allocated_storage      = var.rds_allocated_storage
  vpc_security_group_ids = [module.sg.rds_sg_id]
  subnet_ids             = module.vpc.private_subnet_ids
}
module "ssm" {
  source       = "./modules/ssm"
  
  rds_username = var.rds_username
  rds_password = var.rds_password
  rds_address  = module.rds.db_address
  rds_db_name  = var.rds_db_name
}