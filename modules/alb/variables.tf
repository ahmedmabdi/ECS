variable "name" {
  type        = string
  description = "name of the ALB"
}

variable "vpc_id" {
  type        = string
  description = "vpc id where ALB will be deployed"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet ids"
}

variable "alb_sg_id" {
  type        = string
  description = "Security group id for the ALB"
}

variable "certificate_arn" {
  type        = string
  description = "acm certificate arn for HTTPS"
  default     = ""
}

variable "health_check_path" {
  description = "path for alb target group health check"
  type        = string
}

variable "target_port" {
  type        = number
  description = "port the alb will forward to"
}
