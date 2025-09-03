variable "cluster_name" {
  description = "name of the ECS cluster"
  type        = string
  default     = "ecs-umami"
}
variable "vpc_id" {
  type        = string
}

variable "task_family" {
  description = "ecs task family name"
  type        = string
}

variable "task_cpu" {
  description = "cpu units for the ECS task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "memory for the ECS task (MB)"
  type        = string
  default     = "512"
}

variable "task_role_arn" {
  description = "iam task role ARN for ECS tasks (optional)"
  type        = string
  default     = ""
}

variable "container_name" {
  description = "name of the container"
  type        = string
}

variable "container_image" {
  description = "container image for the ECS task"
  type        = string
}

variable "container_port" {
  description = "port container listens on"
  type        = number
}

variable "service_name" {
  description = "ecs service name"
  type        = string
}

variable "desired_count" {
  description = "number of tasks to run by default"
  type        = number
  default     = 1
}

variable "min_count" {
  description = "minimum number of ECS tasks for auto-scaling"
  type        = number
  default     = 1
}

variable "max_count" {
  description = "aximum number of ECS tasks for auto-scaling"
  type        = number
  default     = 3
}

variable "private_subnets" {
  description = "List of private subnet IDs for ECS tasks"
  type        = list(string)
}


variable "target_group_arn" {
  description = "Target group ARN for ECS service load balancing"
  type        = string
}

variable "region" {
  description = "AWS region for deployment"
  type        = string
}
variable "rds_username" {
  description = "RDS master username"
  type        = string
}

variable "rds_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "rds_db_name" {
  description = "RDS database name"
  type        = string
}

variable "rds_address" {
  description = "RDS endpoint address"
  type        = string
}

variable "rds_port" {
  description = "RDS port number"
  type        = number
  default     = 5432
}
variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ARN of the ECS task role"
  type        = string
}
variable "ecs_sg_id" {
  description = "ECS Security Group ID"
  type        = string
}
variable "security_groups" {
  description = "List of security group IDs to attach to ECS tasks"
  type        = list(string)
}
