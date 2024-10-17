# resource "kubernetes_namespace" "app" {
#   metadata {
#     name = local.service.app.namespace
#   }
# }