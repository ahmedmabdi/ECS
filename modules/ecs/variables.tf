variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "ecs-umami"
}

variable "task_family" {
  description = "ECS task family name"
  type        = string
}

variable "task_cpu" {
  description = "CPU units for the ECS task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Memory for the ECS task (MB)"
  type        = string
  default     = "512"
}

variable "execution_role_arn" {
  description = "IAM execution role ARN for ECS tasks"
  type        = string
}

variable "task_role_arn" {
  description = "IAM task role ARN for ECS tasks (optional)"
  type        = string
  default     = ""
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_image" {
  description = "Container image for the ECS task"
  type        = string
}

variable "container_port" {
  description = "Port container listens on"
  type        = number
}

variable "service_name" {
  description = "ECS service name"
  type        = string
}

variable "desired_count" {
  description = "Number of tasks to run by default"
  type        = number
  default     = 1
}

variable "min_count" {
  description = "Minimum number of ECS tasks for auto-scaling"
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum number of ECS tasks for auto-scaling"
  type        = number
  default     = 3
}

variable "private_subnets" {
  description = "List of private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "security_groups" {
  description = "Security group IDs for ECS tasks"
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

variable "database_url" {
  description = "The DATABASE_URL for ECS"
  type        = string
  sensitive   = true
}