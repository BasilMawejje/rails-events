variable "aws_region" { default = "us-east-1" }
variable "cluster_name" { default = "secure-eks-cluster" }
variable "db_password" { sensitive = true }
variable "istio_version" { default = "1.24.0" }
