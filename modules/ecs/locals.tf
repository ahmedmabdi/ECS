locals {
  database_url = "postgresql://${var.rds_username}:${var.rds_password}@${var.db_endpoint}:${var.db_port}/${var.rds_db_name}"
}