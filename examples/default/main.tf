provider "aws" {
  region  = "eu-west-1"
  version = "1.39"
}

provider "aws" {
  alias   = "us-east-1"
  region  = "us-east-1"
  version = "1.39"
}

locals {
  dns = "${var.domain_name}"
}

data "aws_acm_certificate" "ssl_certificate_us_east" {
  provider = "aws.us-east-1"
  domain   = "*.${local.dns}"
  statuses = ["ISSUED"]
}

module "cloudfront" {
  source = "../../"

  environment = "forest"
  name        = "default"
  subdomain   = "cdn"

  dns_name = "${local.dns}"

  ssl_certificate_arn = "${data.aws_acm_certificate.ssl_certificate_us_east.arn}"
}

output "output" {
  description = "Module outputs."

  value = {
    cloudfront_dns_record = "${module.cloudfront.cloudfront_dns_record}"
    cloudfront_bucket_arn = "${module.cloudfront.cloudfront_bucket_arn}"
    route53_dns_record    = "${module.cloudfront.route53_dns_record}"
  }
}
