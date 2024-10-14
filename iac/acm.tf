# iac/acm/acm.tf

resource "aws_acm_certificate" "this" {
  domain_name = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  count   = length(aws_acm_certificate.this.domain_validation_options)
  zone_id = aws_route53_zone.this.zone_id
  name    = aws_acm_certificate.this.domain_validation_options[count.index].resource_record_name
  type    = aws_acm_certificate.this.domain_validation_options[count.index].resource_record_type
  ttl     = 60
  records = [aws_acm_certificate.this.domain_validation_options[count.index].resource_record_value]
}
