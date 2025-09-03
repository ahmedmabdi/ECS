output "cloudwatch_log_group_name" {
  description = "log group name cloudwatch"
  value       = aws_cloudwatch_log_group.ecs.name
}