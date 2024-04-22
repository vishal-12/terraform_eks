variable "clusterName" {
  type = string
  description = "EKS cluster name"
}

variable "Environment" {
  type = string
  description = "Environment Tag for EKS Cluster"
}

variable "subnet_ids" {
  type = list(string)
  description = "EKS Cluster allowed subnets"
}

variable "vpc_id"{
    type = string
    description = "VPC ID where we need to deploy EKS Cluster"
}