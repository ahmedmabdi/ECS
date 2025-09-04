variable "rds_username" {
  type = string
}

variable "rds_password" {
  type = string
  sensitive = true
}

variable "rds_db_name" {
  type = string
}

variable "rds_address" {
  type = string
}