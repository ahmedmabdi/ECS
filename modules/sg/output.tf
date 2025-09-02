# ----------------------------
# Outputs
# ----------------------------
output "ecs_sg_id" {
  value       = aws_security_group.ecs_sg.id
  description = "ID of ECS security group"
}

output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "ID of ALB security group"
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "ID of RDS security group"
}

output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

