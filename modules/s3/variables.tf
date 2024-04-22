variable "s3bucketName" {
  type        = string
  default     = "s3bucket"
  description = "S3 Bucket Name for Frontend"
}

variable "s3bucketDeployer" {
  type        = string
  default     = "s3bucketAllowUser"
  description = "S3 Bucket Allow from Specific User"
}