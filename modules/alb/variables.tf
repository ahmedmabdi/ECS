variable "name" {
  type        = string
  description = "Name of the ALB"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where ALB will be deployed"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "alb_sg_id" {
  type        = string
  description = "Security group ID for the ALB"
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for HTTPS"
  default     = ""
}

variable "health_check_path" {
  type        = string
  description = "Path for health checks"
}

variable "target_port" {
  type        = number
  description = "Port the ALB will forward to"
}
