# iac/route53.alias.api.tf

resource "aws_route53_record" "api" {
    zone_id = aws_route53_zone.dev_environment.zone_id
    name    = "api.${var.domain_name}"
    type    = "A"
    ttl     = 60
    records = [
      aws_eks_cluster.this.endpoint
    ]
  }
