# iac/eks.nginx_ingress_controller.tf

# resource "helm_release" "nginx_ingress" {
#   name       = "nginx-ingress"
#   repository = "https://charts.helm.sh/stable"
#   chart      = "nginx-ingress"
#
#   set {
#     name  = "controller.replicaCount"
#     value = var.nginx_ingress_replicas
#   }
#
#   set {
#     name  = "controller.service.type"
#     value = "LoadBalancer"
#   }
#
#   set {
#     name  = "controller.service.annotations"
#     value = "service.beta.kubernetes.io/aws-load-balancer-internal=false"
#   }
#
#   # ...add more configurations here as necessary...
# }