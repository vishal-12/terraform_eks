variable "s3arn" {
  type        = string
  default     = "s3arn"
  description = "S3 ARN"
}

variable "origin_access_identity"{
    type = string 
    default = "origin_access_identity"
    description = "Origin Access Identity for S3"
}

variable "frontEndDomain" {
  type        = string
  default     = "frontend"
  description = "Front End Domain Name for CDN ACM Certificate"
}

variable "Environment" {
  type = string
  default = "management"
  description = "Environment Tag for resources"
}

variable "frontend_certificate_arn"{
    type = string
    description = "Front end SSL Certificate ARN"
}