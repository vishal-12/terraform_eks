variable "serviceBranch" {
  type = string
  description = "Service branch in GitOps"
}

variable "namespace" {
  type = string
  description = "Service namespace"
}

variable "gitPassword" {
  type = string
  description = "Github Password for Argocd Application"
}

variable "aws_eks_cluster_endpoint"{
    type = string
    description =  "data.aws_eks_cluster.cluster.endpoint"
}

variable "aws_eks_cluster_certificate_authority"{
    type = string
    description = "data.aws_eks_cluster.cluster.certificate_authority.0.data"
}

variable "aws_eks_cluster_token"{
    type = string
    description = "data.aws_eks_cluster_auth.cluster.token"
}