
output "frontend_certificate" {
  description = "Frontend Certificate ARN"
  value       = aws_acm_certificate.backend_cert.arn
}

output "backend_certificate" {
  description = "backend Certificate ARN"
  value       = aws_acm_certificate.backend_cert.arn
}