output "bucket_regional_domain_name" {
  value = aws_s3_bucket.s3.bucket_regional_domain_name
}

output "origin_access_identity_arn"{
    value = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
}