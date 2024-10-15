#
# resource "aws_acm_certificate" "grafana_cert" {
#   domain_name       = local.grafana_fqdn
#   validation_method = "DNS"
#
#   lifecycle {
#     create_before_destroy = true
#   }
# }
