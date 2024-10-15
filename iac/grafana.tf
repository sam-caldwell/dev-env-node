# iac/grafana.tf
# resource "helm_release" "grafana" {
#   name       = local.grafana_name
#   repository = "https://grafana.github.io/helm-charts"
#   chart      = "grafana"
#   version    = "6.17.6"
#   set {
#     name  = "replicas"
#     value = 1
#   }
#
#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }
#
#   set {
#     name  = "admin.password"
#     value = aws_secretsmanager_secret_version.grafana_admin.secret_string
#   }
#
#   set {
#     name  = "persistence.enabled"
#     value = "true"
#   }
#
#   set {
#     name  = "persistence.size"
#     value = "5Gi"
#   }
#
#   set {
#     name  = "ingress.enabled"
#     value = "true"
#   }
#
#   set {
#     name = "ingress.className"
#     value = "nginx-ingress"
#   }
#
#   set {
#     name  = "ingress.hosts[0]"
#     value = local.grafana_fqdn
#   }
#
#   set {
#     name = "ingress.annotations"
#     value = jsonencode({
#       "cert-manager.io/cluster-issuer" = "letsencrypt-prod"  # ACM certificate issuer
#       "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
#     })
#   }
#
#   set {
#     name  = "ingress.tls[0].hosts[0]"
#     value = local.grafana_fqdn
#   }
#
#   set {
#     name  = "ingress.tls[0].secretName"
#     value = aws_acm_certificate.grafana_cert.private_key
#   }
# }
