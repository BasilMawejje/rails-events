resource "helm_release" "istio_base" {
  name             = "istio-base"
  chart            = "${path.module}/charts/base"
  namespace        = "istio-system"
  create_namespace = true
}

resource "helm_release" "istiod" {
  name       = "istiod"
  chart      = "${path.module}/charts/istiod"
  namespace  = "istio-system"
  depends_on = [helm_release.istio_base]
  set        = { name = "meshConfig.accessLogFile", value = "/dev/stdout" }
}

resource "helm_release" "istio_ingress" {
  name       = "istio-ingressgateway" # service name used in the creation of the ALB in .istio/4-ingress-gateway.yaml
  chart      = "${path.module}/charts/gateway"
  namespace  = "istio-system"
  depends_on = [helm_release.istiod]
  set        = { name = "service.type", value = "ClusterIP" }
}

# Apply your YAML file
data "kubectl_file_documents" "istio_manifests" {
  content = file("${path.module}/../.k8s/4-ingress-gateway.yaml")
}

resource "kubectl_manifest" "istio_gateway_config" {
  for_each   = data.kubectl_file_documents.istio_manifests.manifests
  yaml_body  = each.value
  depends_on = [module.eks, helm_release.istio_ingress]
}

# Namespace Labeling for Sidecar Injection
resource "kubernetes_labels" "default_ns" {
  api_version = "v1"
  kind        = "Namespace"
  metadata { name = "default" }
  labels = { istio-injection = "enabled" }
}
