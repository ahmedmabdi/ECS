variable "bastion_name" {
  description = "Name of the bastion host"
  type        = string
  default     = "umami-bastion"
}

variable "instance_type" {
  description = "EC2 instance type for the bastion"
  type        = string
  default     = "t3.micro"
}

variable "ami" {
  description = "AMI ID to use for bastion host"
  type        = string
  default     = "ami-0c94855ba95c71c99" # Amazon Linux 2 in eu-west-2
}


variable "home_ip" {
  description = "Your home/public IP for SSH access"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID to deploy the bastion host in"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID where the bastion host will be deployed"
  type        = string
}

variable "key_pair_name" {
  default = "my-ssh-key"
}
variable "bastion_sg_id" {
  type        = string
  description = "Security group ID for bastion host"
}
variable "project_name" {
  type        = string
  description = "Project name prefix for resources"
}