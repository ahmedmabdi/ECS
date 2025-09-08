resource "aws_ssm_parameter" "database_url" {
  name  = "/umami/DATABASE_URL"
  type  = "SecureString"
  value = "postgres://${urlencode(var.rds_username)}:${urlencode(var.rds_password)}@${var.rds_address}/${var.rds_db_name}"
}