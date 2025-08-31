
variable "vpc_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "ecs-umami"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availability zones to create subnets in"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"] 
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets, one per AZ"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets, one per AZ"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}
variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway"
  type        = bool
  default     = true  
}