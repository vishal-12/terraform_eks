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

variable "Environment" {
  type = string
  default = "management"
  description = "Environment Tag for resources"
}

variable "route53_zone"{
    type = string
    description = "Route53 Zone for Resources"
}

variable "frontend_distribution_domain_record" {
  type = string
  description = "CDN Record for Route53"
}