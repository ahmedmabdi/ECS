output "certificate_arn" {
  value       = length(aws_acm_certificate.this) > 0 ? aws_acm_certificate.this[0].arn : ""
  description = "The ARN of the ACM certificate"
}
output "certificate_validation_ref" {
  description = "Reference to ACM certificate validation resource"
  value       = aws_acm_certificate_validation.this
}