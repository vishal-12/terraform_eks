output "frontend_distribution_domain_record"{
    value = aws_cloudfront_distribution.frontend.domain_name
}