
provider "kubectl" {
  host                   = var.aws_eks_cluster_endpoint
  cluster_ca_certificate = base64decode(var.aws_eks_cluster_certificate_authority)
  token                  = var.aws_eks_cluster_token
  load_config_file       = false
}

data "kubectl_path_documents" "repo" {
  /* content = file("./argocd/manifests/repo.yaml") */
  pattern = "./argocd/manifests/*.yaml"
  vars = {
    gitpass = var.gitPassword
  }
}

resource "kubectl_manifest" "repo_apply" {
    for_each  = toset(data.kubectl_path_documents.service.documents)
  yaml_body = each.value
  /* for_each          = data.kubectl_file_documents.repo.manifests
  yaml_body         = each.value
  wait              = true
  server_side_apply = true */
}

#argocd Project
data "kubectl_file_documents" "argo_project" {
  content = file("./argocd/manifests/project.yaml")
}

resource "kubectl_manifest" "argo_project_apply" {

  /* depends_on = [helm_release.argocd] */
  for_each   = data.kubectl_file_documents.argo_project.manifests
  yaml_body  = each.value
}

data "kubectl_path_documents" "service" {
  pattern = "./argocd/application/*.yaml"
  vars = {
    branch = var.serviceBranch
    env    = var.namespace
  }
}

resource "kubectl_manifest" "service" {
  for_each  = toset(data.kubectl_path_documents.service.documents)
  yaml_body = each.value
} 