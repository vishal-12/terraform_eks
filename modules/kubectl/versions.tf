terraform {
  required_providers {
    kubernetes = ">= 1.10.0, < 3.0.0"
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.9.4"
    }
  }
}