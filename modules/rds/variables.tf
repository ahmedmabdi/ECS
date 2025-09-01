variable "rds_db_name" {
  description = "The name of the Postgres database to create."
  type        = string
  default     = "umami"
}

variable "rds_username" {
  description = "The master username for the Postgres database."
  type        = string
}

variable "rds_password" {
  description = "The master password for the Postgres database."
  type        = string
  sensitive   = true
}

variable "rds_instance_type" {
  description = "The instance type of the RDS database."
  type        = string
}

variable "rds_allocated_storage" {
  description = "The allocated storage size for the RDS instance in GB."
  type        = number
  default     = 20
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS instance."
  type        = list(string)
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnets for RDS"
}
variable "engine_version" {
  description = "Postgres engine version for the RDS instance."
  type        = string
  default     = "17.4"  # match your existing RDS
}