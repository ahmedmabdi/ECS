output "certificate_arn" {
  value = aws_acm_certificate.this.arn
}
output "certificate_validation_ref" {
  description = "reference to ACM certificate validation resource"
  value       = aws_acm_certificate_validation.this
}