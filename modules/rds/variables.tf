# Name of the database
variable "db_name" {
  description = "The name of the Postgres database to create."
  type        = string
  default = "umami"
}

# Username for the database
variable "username" {
  description = "The master username for the Postgres database."
  type        = string
}

# Password for the database
variable "password" {
  description = "The master password for the Postgres database."
  type        = string
  sensitive   = true
}

# Instance type for RDS (e.g., db.t3.micro)
variable "instance_type" {
  description = "The instance type of the RDS database."
  type        = string
}

# Allocated storage in GB
variable "allocated_storage" {
  description = "The allocated storage size for the RDS instance in GB."
  type        = number
  default     = 20
}

# List of VPC security group IDs to attach to the RDS instance
variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS instance."
  type        = list(string)
}

# List of subnet IDs for the RDS subnet group
variable "subnet_ids" {
  description = "List of private subnet IDs to associate with the RDS subnet group."
  type        = list(string)
}

# Optional: Whether the RDS instance is publicly accessible
variable "publicly_accessible" {
  description = "Boolean flag to indicate if the RDS instance should be publicly accessible."
  type        = bool
  default     = false
}

# Optional: Postgres engine version
variable "engine_version" {
  description = "Postgres engine version for the RDS instance."
  type        = string
  default     = "15.3"
}