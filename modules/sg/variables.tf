variable "vpc_id" {
  description = "The VPC ID where the SGs will be created"
  type        = string
}

variable "project_name" {
  description = "Name prefix for security groups"
  type        = string
  default     = "ecs-umami"
}

variable "allowed_ips" {
  description = "List of IPs allowed to access the app (for demo: ['0.0.0.0/0'])"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "my_home_ip" {
  description = "Home IP address for RDS access"
  type        = string
}