output "alb_arn" {
  description = "arn of the ALB"
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "dns name of the ALB"
  value       = aws_lb.this.dns_name
}

output "alb_zone_id" {
  description = "zone id of the ALB"
  value       = aws_lb.this.zone_id
}

output "target_group_arn" {
  description = "arn of the ALB target group"
  value       = aws_lb_target_group.this.arn
}