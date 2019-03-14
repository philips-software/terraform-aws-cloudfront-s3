output "route53_dns_record" {
  description = "The Rounte53 DNS name attached to CloudFront."
  value       = "${element(concat(aws_route53_record.web.*.name, list("")), 0)}"
}

output "cloudfront_dns_record" {
  description = "The CloudFront DNS name"
  value       = "${aws_cloudfront_distribution.web.domain_name}"
}

output "cloudfront_bucket_arn" {
  description = "ARN of the bucket for serving content."
  value       = "${aws_s3_bucket.web.arn}"
}

output "cloudfront_distribution" {
  description = "Cloudfront distribution (id, arn)"

  value = {
    id  = "${aws_cloudfront_distribution.web.id}"
    arn = "${aws_cloudfront_distribution.web.arn}"
  }
}
