output "db_endpoint" {
  value = aws_db_instance.umami_db.address
}

output "db_port" {
  value = aws_db_instance.umami_db.port
}
