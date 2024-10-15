# iac/route53_zone.localstack.dev.tf

resource "aws_route53_zone" "localstack_dev" {
  name = var.domain_name
}
