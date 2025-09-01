output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "rds_port" {
  value = module.rds.db_port
}
output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The DNS name of the ALB"
}