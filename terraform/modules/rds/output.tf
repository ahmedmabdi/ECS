output "db_address" {
  value       = aws_db_instance.umami_db.endpoint
}


output "db_identifier" {
  value = aws_db_instance.umami_db.identifier
}
output "db_port" {
  value = tonumber(aws_db_instance.umami_db.port)
}