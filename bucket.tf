data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}

data "aws_caller_identity" "current" {
}

locals {
  bucket_name_default = "${data.aws_caller_identity.current.account_id}-${var.environment}-${var.name}"
  bucket_name         = var.bucket_name == "" ? local.bucket_name_default : var.bucket_name
}

resource "aws_s3_bucket_policy" "web" {
  bucket = aws_s3_bucket.web.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_s3_bucket" "web" {
  bucket        = local.bucket_name
  acl           = var.bucket_acl
  force_destroy = var.bucket_force_destroy

  tags = merge(
    {
      "Name" = format("%s", "Bucket for CloudFront ${var.environment}")
    },
    {
      "Environment" = format("%s", var.environment)
    },
    var.tags,
  )

  versioning {
    enabled = var.bucket_versioning
  }

  lifecycle_rule {
    id      = "expire-old-versions"
    prefix  = "*"
    enabled = var.bucket_versioning

    noncurrent_version_expiration {
      days = 7
    }
  }
}

