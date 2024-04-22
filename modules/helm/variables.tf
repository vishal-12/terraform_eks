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

variable "spot_termination_handler_chart_name" {
  type        = string
  description = "EKS Spot termination handler Helm chart name."
  default     = "aws-node-termination-handler"
}
variable "spot_termination_handler_chart_repo" {
  type        = string
  description = "EKS Spot termination handler Helm repository name."
  default     = "https://aws.github.io/eks-charts"
}
variable "spot_termination_handler_chart_version" {
  type        = string
  description = "EKS Spot termination handler Helm chart version."
  default     = "0.18.1"
}
variable "spot_termination_handler_chart_namespace" {
  type        = string
  description = "Kubernetes namespace to deploy EKS Spot termination handler Helm chart."
  default     = "kube-system"
}

#argoCD 
variable "argocd_chart_name" {
  type        = string
  description = "ArgoCD Helm chart name."
  default     = "argo-cd"
}
variable "argocd_chart_repo" {
  type        = string
  description = "ArgoCD Helm repository name."
  default     = "https://argoproj.github.io/argo-helm"
}
variable "argocd_chart_version" {
  type        = string
  description = "ArgoCD Helm chart version."
  default     = "5.14.2"
}
variable "argocd_chart_namespace" {
  type        = string
  description = "ArgoCD handler Helm chart."
  default     = "argocd"
}

variable "serviceBranch" {
  type = string
  description = "Service branch in GitOps"
}

variable "namespace" {
  type = string
  description = "Service namespace"
}