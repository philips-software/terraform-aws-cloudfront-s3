output "route53_dns_record" {
  description = "The Rounte53 DNS name attached to CloudFront."
  value       = element(concat(aws_route53_record.web.*.name, [""]), 0)
}

output "cloudfront_dns_record" {
  description = "The CloudFront DNS name"
  value       = aws_cloudfront_distribution.web.domain_name
}

output "cloudfront_bucket" {
  description = "Cloudfront bucket for serving content. (id, arn, domain_name, regional_domain_name)"
  value = {
    id                   = aws_s3_bucket.web.id
    arn                  = aws_s3_bucket.web.arn
    domain_name          = aws_s3_bucket.web.bucket_domain_name
    regional_domain_name = aws_s3_bucket.web.bucket_regional_domain_name
  }
}

output "cloudfront_distribution" {
  description = "Cloudfront distribution (id, arn)"
  value = {
    id  = aws_cloudfront_distribution.web.id
    arn = aws_cloudfront_distribution.web.arn
  }
}

