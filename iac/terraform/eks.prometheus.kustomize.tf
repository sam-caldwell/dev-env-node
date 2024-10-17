#
# resource "null_resource" "kustomize_apply" {
#   provisioner "local-exec" {
#     command = "kubectl apply -k ${local_file.prometheus_yaml.filename}"
#     environment = {
#       KUBECONFIG = local_file.kubeconfig.filename
#     }
#   }
#   depends_on = [
#
#   ]
# }
#
# resource "local_file" "prometheus_yaml" {
#   filename = "prometheus.yaml"
#   content = <<EOF
# ---
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: ${local.service.eks.name}
#   namespace: ${local.service.eks.namespace}
# spec:
#   replicas: ${local.service.eks.replicas}
#   selector:
#     matchLabels:
#       app: ${local.service.eks.namespace}
#   template:
#     metadata:
#       labels:
#         app: ${local.service.eks.name}
#     spec:
#       containers:
#         - name: app
#           image: nginx:1.19.3
#           ports:
#             - containerPort: ${local.service.app.ports.port}
# ---
# apiVersion: v1
# kind: Service
# metadata:
#   name: "${local.service.eks.name}-service"
#   namespace: ${local.service.eks.namespace}
# spec:
#   selector:
#     app: ${local.service.eks.namespace}
#   ports:
#     - protocol: ${local.service.app.ports.protocol}
#       port: ${local.service.app.ports.port}
#       targetPort: ${local.service.app.ports.targetPort}
#
# EOF
# }
