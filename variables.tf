variable "frontEndDomain" {
  type        = string
  default     = "frontend"
  description = "Front End Domain Name for CDN ACM Certificate"
}


variable "backEndDomain" {
  type        = string
  default     = "backend"
  description = "Back End Domain Name for CDN ACM Certificate"
}


variable "s3bucketDeployer" {
  type        = string
  default     = "UIDeployer"
  description = "User ARN who is authorized to perform S3 Actions"
}

variable "s3bucketName" {
  type        = string
  default     = "s3bucket"
  description = "S3 Bucket Name for Frontend"
}

variable "Environment" {
  type        = string
  default     = "management"
  description = "Cluster Environment tag for resources"
}


variable "route53_zone" {
  type        = string
  description = "Route 53 Zone for Resource"
}

variable "subnet_ids" {
  type        = list(string)
  description = "EKS Cluster allowed subnets"
}

variable "clusterName" {
  type        = string
  description = "EKS Cluster name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where we need to deploy EKS Cluster"
}

variable "serviceBranch" {
  type        = string
  description = "Service branch in GitOps"
}

variable "namespace" {
  type        = string
  description = "Service namespace"
}

variable "gitPassword" {
  type = string
  description = "Github Password for Argocd Application"
}