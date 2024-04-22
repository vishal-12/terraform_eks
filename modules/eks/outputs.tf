data "aws_eks_cluster" "cluster" {
  name = module.cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.cluster.cluster_id
}

output "aws_eks_cluster_auth" {
  value = data.aws_eks_cluster.cluster.endpoint
}

output "aws_eks_cluster_endpoint"{
    value = data.aws_eks_cluster.cluster.endpoint
}

output "aws_eks_cluster_certificate_authority"{
    value = data.aws_eks_cluster.cluster.certificate_authority.0.data
}

output "aws_eks_cluster_token"{
    value = data.aws_eks_cluster_auth.cluster.token
}