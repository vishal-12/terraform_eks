data "aws_region" "current" {}

module "s3" {
  source           = "./modules/s3"
  s3bucketName     = var.s3bucketName
  s3bucketDeployer = var.s3bucketDeployer
}

module "acm" {
  source                              = "./modules/acm"
  route53_zone                        = var.route53_zone
  frontEndDomain                      = var.frontEndDomain
  backEndDomain                       = var.backEndDomain
  Environment                         = var.Environment
  frontend_distribution_domain_record = module.cdn.frontend_distribution_domain_record

}

module "cdn" {
  source = "./modules/cdn"
  //aws_s3_bucket.qa[0].bucket_regional_domain_name
  s3arn                    = module.s3.bucket_regional_domain_name
  frontEndDomain           = var.frontEndDomain
  origin_access_identity   = module.s3.origin_access_identity_arn
  frontend_certificate_arn = module.acm.frontend_certificate
}


module "eks" {
  source = "./modules/eks"

  clusterName = var.clusterName
  Environment = var.Environment
  subnet_ids  = var.subnet_ids
  vpc_id      = var.vpc_id
}


module "helm" {
  source = "./modules/helm"

  aws_eks_cluster_endpoint              = module.eks.aws_eks_cluster_endpoint
  aws_eks_cluster_certificate_authority = module.eks.aws_eks_cluster_certificate_authority
  aws_eks_cluster_token                 = module.eks.aws_eks_cluster_token

  serviceBranch = var.serviceBranch
  namespace     = var.namespace

}

module "kubectl_helper" {
  source = "./modules/kubectl"


  gitPassword                           = var.gitPassword
  aws_eks_cluster_endpoint              = module.eks.aws_eks_cluster_endpoint
  aws_eks_cluster_certificate_authority = module.eks.aws_eks_cluster_certificate_authority
  aws_eks_cluster_token                 = module.eks.aws_eks_cluster_token
  serviceBranch                         = var.serviceBranch
  namespace                             = var.namespace

}