#iac/prometheus.tf
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "45.3.1"  # Adjust version as needed

  set {
    name  = "prometheus.prometheusSpec.serviceMonitorSelector"
    value = jsonencode({
      "app" = "grafana"
    })
  }

  set {
    name  = "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues"
    value = "false"
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0]"
    value = "prometheus.${var.domain_name}"  # ToDo: Replace with your domain
  }

  set {
    name  = "ingress.annotations"
    value = jsonencode({
      "cert-manager.io/cluster-issuer" = "letsencrypt-prod"  # ACM certificate issuer
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
    })
  }

  set {
    name  = "ingress.tls[0].hosts[0]"
    value = "prometheus.yourdomain.com"  # Same as above
  }

  set {
    name  = "ingress.tls[0].secretName"
    value = "prometheus-tls"  # ToDo: Replace with your ACM certificate secret
  }
}
