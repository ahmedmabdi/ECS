output "db_address" {
  value = aws_db_instance.umami_db.address
}

output "db_port" {
  value = aws_db_instance.umami_db.port
}

output "db_identifier" {
  value = aws_db_instance.umami_db.identifier
}