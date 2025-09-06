variable "db_name" {
  description = "The name of the Postgres database to create."
  type        = string
  default = "umami"
}

variable "username" {
  type        = string
}

variable "password" {
  type        = string
  sensitive   = true
}

variable "instance_type" {
  type        = string
}

variable "allocated_storage" {
  type        = number
  default     = 20
}

variable "vpc_security_group_ids" {
  type        = list(string)
}

variable "subnet_ids" {
  type        = list(string)
}

variable "publicly_accessible" {
  type        = bool
  default     = false
}

variable "engine_version" {
  type        = string
  default     = "15.3"
}
variable "db_identifier" {
  type        = string
  default     = "umami-db"
}