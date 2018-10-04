locals {
  subdomain = "${var.subdomain == "" ? var.environment : var.subdomain}"
}

data "aws_route53_zone" "zone" {
  count = "${var.enable_route53_record}"
  name  = "${var.dns_name}"
}

resource "aws_route53_record" "web" {
  count = "${var.enable_route53_record}"

  zone_id = "${data.aws_route53_zone.zone.id}"
  name    = "${local.subdomain}.${data.aws_route53_zone.zone.name}"

  type = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.web.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.web.hosted_zone_id}"
    evaluate_target_health = false
  }
}
