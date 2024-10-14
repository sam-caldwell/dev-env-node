# iac/prometheus.tf

resource "kubernetes_deployment" "prometheus" {
  metadata {
    name = "prometheus"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "prometheus"
      }
    }
    template {
      metadata {
        labels = {
          app = "prometheus"
        }
      }
      spec {
        container {
          image = "prom/prometheus"
          name  = "prometheus"
          ports {
            container_port = 9090
          }
        }
      }
    }
  }
}
