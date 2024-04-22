provider "helm" {
  kubernetes {
    host                   = var.aws_eks_cluster_endpoint
    cluster_ca_certificate = base64decode(var.aws_eks_cluster_certificate_authority)
    token                  = var.aws_eks_cluster_token
  }
}

resource "helm_release" "spot_termination_handler" {
  name          = var.spot_termination_handler_chart_name
  chart         = var.spot_termination_handler_chart_name
  repository    = var.spot_termination_handler_chart_repo
  version       = var.spot_termination_handler_chart_version
  namespace     = var.spot_termination_handler_chart_namespace
  wait_for_jobs = true
}


# deploy argoCD
resource "helm_release" "argocd" {
  name = var.argocd_chart_name
  repository       = var.argocd_chart_repo
  chart            = var.argocd_chart_name
  namespace        = var.argocd_chart_namespace
  version          = var.argocd_chart_version
  create_namespace = true
  values = [
    file("argocd/application.yaml")
  ]
}
