resource "aws_acm_certificate" "prometheus_cert" {
  domain_name       = "prometheus.${var.domain_name}"
  validation_method = "DNS"

  tags = {
    Name = "Prometheus-TLS"
  }
}
