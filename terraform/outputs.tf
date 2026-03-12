output "debug_paths" {
  value = {
    module_path = path.module
    root_path   = path.root
    working_dir = path.cwd
    # This checks if your specific Istio file is actually visible to Terraform
    istio_file_exists = fileexists("${path.module}/../.istio/4-ingress-gateway.yaml")
  }
}
