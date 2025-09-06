variable "cluster_name" {
  type        = string
  default     = "ecs-umami"
}
variable "vpc_id" {
  type        = string
}

variable "task_family" {
  type        = string
}

variable "task_cpu" {
  type        = string
  default     = "256"
}

variable "task_memory" {
  type        = string
  default     = "512"
}

variable "task_role_arn" {
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

variable "service_name" {
  type        = string
}

variable "desired_count" {
  type        = number
  default     = 1
}

variable "min_count" {
  type        = number
  default     = 1
}

variable "max_count" {
  type        = number
  default     = 3
}

variable "private_subnets" {
  type        = list(string)
}


variable "target_group_arn" {
  type        = string
}

variable "region" {
  type        = string
}
variable "rds_username" {
  type        = string
}

variable "rds_password" {
  type        = string
  sensitive   = true
}

variable "rds_db_name" {
  type        = string
}

variable "rds_address" {
  type        = string
}

variable "rds_port" {
  type        = number
  default     = 5432
}
variable "execution_role_arn" {
  type        = string
}

variable "ecs_task_role_arn" {
  type        = string
}
variable "ecs_sg_id" {
  type        = string
}
variable "security_groups" {
  type        = list(string)
}
variable "database_url_arn" {
  type = string
}