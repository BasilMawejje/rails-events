terraform {
  required_providers {
    aws        = { source = "hashicorp/aws", version = "~> 5.92" }
    kubernetes = { source = "hashicorp/kubernetes", version = "3.0.1" }
    helm       = { source = "hashicorp/helm", version = "3.1.1" }
    kubectl    = { source = "gavinbunney/kubectl", version = "1.19.0" }
  }

  # Secure State Storage
  backend "s3" {
    bucket       = "my-unique-tfstate-bucket"
    key          = "eks/prod.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

  required_version = ">= 1.2"
}
