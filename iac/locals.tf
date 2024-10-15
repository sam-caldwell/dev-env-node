locals {

  use_default = "" # this is a simple syntactic sugar to make things more readable.

  grafana_name    = "grafana"
  prometheus_name = "prometheus"

  grafana_fqdn = "grafana.${var.domain_name}"
}

locals {

}