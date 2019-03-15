provider "aws" {
  region  = "eu-west-1"
  version = "2.1.0"
}

module "cloudfront" {
  source = "../../"

  enable_route53_record = false

  environment = "forest"
  name        = "no-route-53"

  bucket_force_destroy = true
}

output "output" {
  description = "Module outputs."

  value = {
    cloudfront_dns_record = "${module.cloudfront.cloudfront_dns_record}"
    cloudfront_bucket_arn = "${module.cloudfront.cloudfront_bucket_arn}"
  }
}
