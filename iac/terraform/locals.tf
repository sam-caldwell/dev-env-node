locals {

  service = {
    app={
      name="application"
      namespace="sre-challenge"
      replica=3
      ports={
        protocol="TCP"
        port=80
        targetPort=80
      }
    }
    eks={
      name = "eks-cluster"
      namespace = "sre-challenge"
      replicas = 3
    }
    alertmanager = {
      enabled      = false
      name         = local.alertmanager_name
      fqdn         = "${local.alertmanager_name}.${var.domain_name}"
      ingress_type = "NodePort"
      ports = {
        listen   = "9093"
        nodePort = "30903"
      }
    }
    grafana = {
      enabled      = true
      name         = local.grafana_name
      fqdn         = "${local.grafana_name}.${var.domain_name}"
      ingress_type = "NodePort"
    }
    prometheus = {
      enabled   = true
      name      = local.prometheus_name
      namespace = var.prometheus_namespace == local.use_default ? local.prometheus_name : var.prometheus_namespace
      fqdn      = "${local.prometheus_name}.${var.domain_name}"
      ports = {
        listen = "9090"
        targetPort = "9090"
      }
      podSecurityPolicy = {
        enabled = false
      }
    }
  }

  # These identifiers define strings we use a lot.  Use these to avoid typos...
  use_default = "" # this is a simple syntactic sugar to make things more readable.
  alertmanager_name = "alertmanager"
  grafana_name      = "grafana"
  prometheus_name   = "prometheus"
  testapp_name      = "my-app"

}
