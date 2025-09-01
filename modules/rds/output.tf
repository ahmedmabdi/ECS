output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.umami_db.address
}

output "db_port" {
  description = "RDS port"
  value       = aws_db_instance.umami_db.port
}