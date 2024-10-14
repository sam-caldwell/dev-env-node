# iac/aws_route53_zone.tf

resource "aws_route53_zone" "localstack_dev" {
  name = var.domain_name
}

resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.this.zone_id
  name     = "api.${var.domain_name}"
  type     = "A"
  alias {
    name                   = aws_eks_cluster.this.endpoint
    zone_id                = aws_eks_cluster.this.endpoint
    evaluate_target_health = true
  }
}
