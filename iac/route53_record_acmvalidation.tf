# iac/route53_record_acmvalidation.tf

resource "aws_route53_record" "validation" {
  count   = length(aws_acm_certificate.this.domain_validation_options)
  zone_id = aws_route53_zone.localstack_dev.zone_id

  name    = tolist(aws_acm_certificate.this.domain_validation_options)[count.index].resource_record_name
  type    = tolist(aws_acm_certificate.this.domain_validation_options)[count.index].resource_record_type
  ttl     = 60
  records = [tolist(aws_acm_certificate.this.domain_validation_options)[count.index].resource_record_value]
}
