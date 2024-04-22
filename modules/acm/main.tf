resource "aws_acm_certificate" "frontend_cert" {
  domain_name       = "${var.frontEndDomain}.dizzion.io"
  validation_method = "DNS"
  tags = {
    Environment = var.Environment
  }
  provider = aws.virginia

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "frontend_cert_validation" {
  provider                = aws.virginia
  certificate_arn         = aws_acm_certificate.frontend_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.frontend_acm_records : record.fqdn]
}


resource "aws_route53_record" "frontend" {
  zone_id = var.route53_zone
  name    = var.frontEndDomain
  type    = "CNAME"
  ttl     = 300
  records = [var.frontend_distribution_domain_record]
}

resource "aws_route53_record" "frontend_acm_records" {
  /* depends_on = [aws_acm_certificate.frontend_cert] */
  for_each = {
    for dvo in aws_acm_certificate.frontend_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.route53_zone
}


resource "aws_acm_certificate" "backend_cert" {
  domain_name       = "${var.backEndDomain}.dizzion.io"
  validation_method = "DNS"
  tags = {
    Environment = var.Environment
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "backend_acm_records" {

  depends_on = [aws_acm_certificate.backend_cert]
  for_each = {
    for dvo in aws_acm_certificate.backend_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.route53_zone
}