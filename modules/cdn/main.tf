locals {
  s3_origin_id = "website"
}

resource "aws_cloudfront_distribution" "frontend" {

  origin {
    connection_attempts = 3
    connection_timeout  = 10
    domain_name         = var.s3arn
    origin_id           = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = var.origin_access_identity
    }
  }

  aliases             = ["${var.frontEndDomain}.dizzion.io"]
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CDN ${var.Environment}"
  default_root_object = "index.html"

  http_version = "http2"
  custom_error_response {

    error_code            = 403
    response_code         = 200
    error_caching_min_ttl = 0
    response_page_path    = "/index.html"
  }

  default_cache_behavior {
    target_origin_id = local.s3_origin_id
    compress         = true
    allowed_methods  = ["POST", "GET", "HEAD", "PATCH", "DELETE", "OPTIONS", "PUT"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    default_ttl      = 86400
    forwarded_values {
      cookies {
        forward = "none"
      }

      headers      = ["Referer", "Origin", "Accept-Datetime", "Accept", "Access-Control-Request-Method", "Authorization", "Accept-Language", "Accept-Charset", "Accept-Encoding", "Access-Control-Request-Headers"]
      query_string = false
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"
  restrictions {
    geo_restriction {
      locations        = ["RU"]
      restriction_type = "blacklist"
    }

  }

  tags = {
    Environment = "CDN-${var.Environment}"
  }

  viewer_certificate {
    acm_certificate_arn      = var.frontend_certificate_arn
    minimum_protocol_version = "TLSv1.1_2016"
    ssl_support_method       = "sni-only"
  }

}


