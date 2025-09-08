variable "project_name" {
  type        = string
}

variable "environment" {
  type        = string
}

variable "aws_region" {
  description =  "region"
  type        = string
  default     = "eu-west-2"
}
variable "cluster_name" {
  type        = string
}

variable "service_name" {
  type        = string
}

variable "cpu_threshold" {
  description = "CPU utilization threshold for scaling/alarm"
  type        = number
  default     = 70
}

