resource "aws_kms_key" "eks_cluster" {
  description = "${var.clusterName}-kms"
}

module "cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = var.clusterName
  cluster_version = "1.24"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }



  cluster_encryption_config = [{
    provider_key_arn = aws_kms_key.eks_cluster.arn
    resources        = ["secrets"]
  }]

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids


  eks_managed_node_groups = {
    qa = {
      name         = "${var.Environment}-spot"
      min_size     = 2
      max_size     = 10
      desired_size = 6

      instance_types = ["t3a.large"]
      capacity_type  = "SPOT"
    }
  }
  manage_aws_auth_configmap = false
  tags = {
    Environment = var.Environment
    Terraform   = "true"
  }
}