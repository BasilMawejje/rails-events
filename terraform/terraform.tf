terraform {
  required_providers {
    aws        = { source = "hashicorp/aws", version = "~> 6.28" }
    kubernetes = { source = "hashicorp/kubernetes", version = "3.0.1" }
    helm       = { source = "hashicorp/helm", version = "3.1.1" }
    kubectl    = { source = "gavinbunney/kubectl", version = "1.19.0" }
  }

  required_version = ">= 1.2"
}
