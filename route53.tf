locals {
  subdomain = var.subdomain == "" ? var.environment : var.subdomain
}

data "aws_route53_zone" "zone" {
  count = var.enable_route53_record ? 1 : 0
  name  = var.dns_name
}

resource "aws_route53_record" "web" {
  count = var.enable_route53_record ? 1 : 0

  zone_id = data.aws_route53_zone.zone[0].id
  name    = "${local.subdomain}.${data.aws_route53_zone.zone[0].name}"

  type = "A"

  alias {
    name                   = aws_cloudfront_distribution.web.domain_name
    zone_id                = aws_cloudfront_distribution.web.hosted_zone_id
    evaluate_target_health = false
  }
}

