variable "project_name" {
  description = "Name of the ECS project"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
variable "cluster_name" {
  description = "Name of the ECS cluster to monitor"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service to monitor"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU utilization threshold for scaling/alarm"
  type        = number
  default     = 70
}

