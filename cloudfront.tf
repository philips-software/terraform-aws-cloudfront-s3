resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "${var.environment}-cloudfront-access-identity"
}

resource "aws_cloudfront_distribution" "web" {
  origin {
    domain_name = "${aws_s3_bucket.web.bucket_regional_domain_name}"
    origin_id   = "${var.environment}-${var.name}"

    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
    }
  }

  restrictions {
    geo_restriction {
      locations        = "${var.restrictions_geo_restriction_location}"
      restriction_type = "${var.restrictions_geo_restriction_restriction_type}"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "${var.default_root_object}"

  default_cache_behavior {
    allowed_methods  = "${var.default_cache_behavior_allowed_methods}"
    cached_methods   = "${var.default_cache_behavior_cached_methods}"
    compress         = "${var.default_cache_behavior_compress}"
    target_origin_id = "${var.environment}-${var.name}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"

    min_ttl     = "${var.min_ttl}"
    default_ttl = "${var.default_ttl}"
    max_ttl     = "${var.max_ttl}"
  }

  price_class = "${var.price_class}"
  tags        = "${merge(map("Name", format("%s", "CloudFront Distribution ${var.environment}-${var.name}")), map("Environment", format("%s", var.environment)), var.tags)}"

  viewer_certificate {
    cloudfront_default_certificate = "${var.enable_route53_record ? false : true}"

    acm_certificate_arn      = "${var.enable_route53_record ? var.ssl_certificate_arn : ""}"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "${var.ssl_minimum_protocol_version}"
  }
}
