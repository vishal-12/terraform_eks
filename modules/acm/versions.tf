provider "aws" {
  region = "us-west-2"

  endpoints {
    acm            = "https://acm-fips.us-west-2.amazonaws.com"
  }
}


terraform {
  required_version = ">= 0.15"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.40.0"
    }
  }
}
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}