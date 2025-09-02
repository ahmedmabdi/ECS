# Root variables

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}
variable "vpc_name" {
  description = "Name of the vpc"
  type        = string
  default     = "ecs-umami"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b", ]
}

variable "public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "allowed_ips" {
  description = "List of CIDR blocks allowed to access the application (for ALB and ECS)"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ecs_execution_role_name" {
  description = "Name of the ECS execution role"
  type        = string
  default     = "ecs_execution_role"
}


variable "acm_domain_name" {
  description = "Domain name for ACM certificate (optional)"
  type        = string
  default     = ""
}
variable "acm_sans" {
  description = "Subject alternative names for ACM certificate (optional)"
  type        = list(string)
  default     = []
}

variable "route53_zone_id" {
  description = "Hosted zone ID for Route 53 (optional)"
  type        = string
  default     = ""
}
variable "container_name" {
  type        = string
  description = "Name of the container"
}

variable "container_image" {
  type        = string
  description = "Container image URI"
}

variable "container_port" {
  type        = number
  description = "Port the container listens on"
}

variable "rds_db_name"           { default = "umami" }
variable "rds_username"          { default = "umami_user" }
variable "rds_password"          { default = "StrongPass123!" }
variable "rds_instance_type"     { default = "db.t3.micro" }
variable "rds_allocated_storage" { default = 20 }
variable "home_ip"               { default = "82.18.254.202/32" }
variable "project" {
  type = string
  default = "umami"
}
variable "project_name" {
  type        = string
  description = "Project name prefix for resources"
  default = "umami"
}
variable "bastion_key_name" {
  description = "Key pair name for SSH access to Bastion"
  type        = string
}
