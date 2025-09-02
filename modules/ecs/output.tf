output "cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "service_name" {
  value = aws_ecs_service.this.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.this.arn
}

output "cluster_name" {
  value = aws_ecs_cluster.this.name
}
output "ecs_sg_id" {
  value       = var.ecs_sg_id
  description = "ID of the ECS security group passed from SG module"
}