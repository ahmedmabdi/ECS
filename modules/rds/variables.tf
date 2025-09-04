variable "db_name" {
  description = "The name of the Postgres database to create."
  type        = string
  default = "umami"
}

variable "username" {
  description = "The master username for the Postgres database."
  type        = string
}

variable "password" {
  description = "The master password for the Postgres database."
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "The instance type of the RDS database."
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage size for the RDS instance in GB."
  type        = number
  default     = 20
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS instance."
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of private subnet IDs to associate with the RDS subnet group."
  type        = list(string)
}

variable "publicly_accessible" {
  description = "Boolean flag to indicate if the RDS instance should be publicly accessible."
  type        = bool
  default     = false
}

variable "engine_version" {
  description = "Postgres engine version for the RDS instance."
  type        = string
  default     = "15.3"
}
variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "umami-db"
}