resource "helm_release" "prometheus" {
  name       = local.prometheus_name
  namespace  = var.prometheus_namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "65.2.0"

  values = [
    yamlencode(local.prometheus_values)
  ]
}

locals {
  prometheus_values = {
    prometheus = {
      enabled = true
      serviceMonitorSelector = {
        matchLabels = {
          app = local.testapp_name
        }
      }
      serviceAccount = {
        create = true
        name   = local.prometheus_name
      }
      podSecurityPolicy = {
        enabled = true  # Enable if you want to use PSP
      }
      alerting = {
        alertmanagers = [
          {
            name = "alertmanager"
            port = "9093"
          }
        ]
      }
    }

    alertmanager = {
      enabled = true
      service = {
        enabled = true
        type    = "ClusterIP"  # Todo: Change to LoadBalancer when done
      }
      ingress = {
        enabled = true
        hosts = [
          local.prometheus_fqdn
        ]
      }
    }

    grafana = {
      enabled = true
      adminPassword = aws_secretsmanager_secret_version.grafana_admin.secret_string
      service = {
        type = "ClusterIP"  # Todo: Change to LoadBalancer when done
      }
      ingress = {
        enabled = true
        hosts = [
          local.grafana_fqdn
        ]
      }
    }
  }
}
