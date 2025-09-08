# Root variables

variable "aws_region" {
  type        = string
  default     = "eu-west-2"
}
variable "vpc_name" {
  type        = string
  default     = "ecs-umami"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b", ]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "allowed_ips" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ecs_execution_role_name" {
  type        = string
  default     = "ecs_execution_role"
}


variable "acm_domain_name" {
  type        = string
  default     = ""
}
variable "acm_sans" {
  type        = list(string)
  default     = []
}

variable "route53_zone_id" {
  type        = string
  default     = ""
}
variable "container_name" {
  type        = string
}

variable "container_image" {
  type        = string
}

variable "container_port" {
  type        = number
}

variable "rds_db_name" {
  type        = string
}

variable "rds_username" {
  type        = string
}

variable "rds_password" {
  type        = string
  sensitive   = true
}

variable "rds_instance_type" {
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  type        = number
  default     = 20
}


variable "project" {
  type = string
  default = "umami"
}
variable "project_name" {
  type        = string
  default = "umami"
}
