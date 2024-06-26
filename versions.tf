provider "aws" {
  region = "us-west-2"

  endpoints {
    acm            = "https://acm-fips.us-west-2.amazonaws.com"
    acmpca         = "https://acm-pca-fips.us-west-2.amazonaws.com"
    apigateway     = "https://apigateway-fips.us-west-2.amazonaws.com"
    appstream      = "https://appstream2-fips.us-west-2.amazonaws.com"
    cloudformation = "https://cloudformation-fips.us-west-2.amazonaws.com"
    /* cloudfront       = "https://cloudfront-fips.amazonaws.com" */
    cloudtrail       = "https://cloudtrail-fips.us-west-2.amazonaws.com"
    codebuild        = "https://codebuild-fips.us-west-2.amazonaws.com"
    codecommit       = "https://codecommit-fips.us-west-2.amazonaws.com"
    codedeploy       = "https://codedeploy-fips.us-west-2.amazonaws.com"
    cognitoidentity  = "https://cognito-identity-fips.us-west-2.amazonaws.com"
    cognitoidp       = "https://cognito-idp-fips.us-west-2.amazonaws.com"
    configservice    = "https://config-fips.us-west-2.amazonaws.com"
    datasync         = "https://datasync-fips.us-west-2.amazonaws.com"
    directconnect    = "https://directconnect-fips.us-west-2.amazonaws.com"
    dms              = "https://dms-fips.us-west-2.amazonaws.com"
    ds               = "https://ds-fips.us-west-2.amazonaws.com"
    dynamodb         = "https://dynamodb-fips.us-west-2.amazonaws.com"
    ec2              = "https://ec2-fips.us-west-2.amazonaws.com"
    ecr              = "https://ecr-fips.us-west-2.amazonaws.com"
    elasticache      = "https://elasticache-fips.us-west-2.amazonaws.com"
    elasticbeanstalk = "https://elasticbeanstalk-fips.us-west-2.amazonaws.com"
    elb              = "https://elasticloadbalancing-fips.us-west-2.amazonaws.com"
    emr              = "https://elasticmapreduce-fips.us-west-2.amazonaws.com"
    es               = "https://es-fips.us-west-2.amazonaws.com"
    fms              = "https://fms-fips.us-west-2.amazonaws.com"
    glacier          = "https://glacier-fips.us-west-2.amazonaws.com"
    guardduty        = "https://guardduty-fips.us-west-2.amazonaws.com"
    inspector        = "https://inspector-fips.us-west-2.amazonaws.com"
    kinesis          = "https://kinesis-fips.us-west-2.amazonaws.com"
    kms              = "https://kms-fips.us-west-2.amazonaws.com"
    lambda           = "https://lambda-fips.us-west-2.amazonaws.com"
    mq               = "https://mq-fips.us-west-2.amazonaws.com"
    pinpoint         = "https://pinpoint-fips.us-west-2.amazonaws.com"
    quicksight       = "https://fips-us-west-2.quicksight.aws.amazon.com"
    rds              = "https://rds-fips.us-west-2.amazonaws.com"
    redshift         = "https://redshift-fips.us-west-2.amazonaws.com"
    resourcegroups   = "https://resource-groups-fips.us-west-2.amazonaws.com"
    route53          = "https://route53-fips.amazonaws.com"
    /* s3               = "https://s3-fips.us-west-2.amazonaws.com" */
    sagemaker      = "https://api-fips.sagemaker.us-west-2.amazonaws.com"
    secretsmanager = "https://secretsmanager-fips.us-west-2.amazonaws.com"
    servicecatalog = "https://servicecatalog-fips.us-west-2.amazonaws.com"
    ses            = "https://email-fips.us-west-2.amazonaws.com"
    shield         = "https://shield-fips.us-east-1.amazonaws.com"
    sns            = "https://sns-fips.us-west-2.amazonaws.com"
    sqs            = "https://sqs-fips.us-west-2.amazonaws.com"
    ssm            = "https://ssm-fips.us-west-2.amazonaws.com"
    sts            = "https://sts-fips.us-west-2.amazonaws.com"
    swf            = "https://swf-fips.us-west-2.amazonaws.com"
    waf            = "https://waf-fips.amazonaws.com"
    wafregional    = "https://waf-regional-fips.us-west-2.amazonaws.com"
    wafv2          = "https://wafv2-fips.us-west-2.amazonaws.com"
  }
}


terraform {
  required_version = ">= 0.15"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.40.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }
  }
}
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}