output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = length(aws_acm_certificate.this) > 0 ? aws_acm_certificate.this[0].arn : null
}

output "certificate_validation_status" {
  description = "The validation status of the ACM certificate"
  value       = length(aws_acm_certificate.this) > 0 ? aws_acm_certificate.this[0].status : null
}