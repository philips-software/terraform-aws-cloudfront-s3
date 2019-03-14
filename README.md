# Terraform module CloudFront Distribution for S3.

A terraform module to a CloudFront Distribution for serving content via a S3 bucket via HTTPS. By default the bucket is private.

By default a route53 record will be created for the provided dns_name. The subdomain is by default a combination of the `environment` and `name`, but can be overridden by providing a `subdomain`. The certificate needs to be a valid certificate and at least available in `us-east-1`.

## Usages

```
module "cloudfront" {
  source = "philips-software/cloudfront-s3/aws"
  version = "1.0.1"

  # Or via github
  # source = "github.com/philips-software/aws-terraform-cloudfront-s3?ref=1.0.1"

  environment = "forest"
  name = "default"

  dns_name   = "mydomain.com"

  ssl_certificate_arn = "ssl_arn"
}

```
The created a bucket can be synced via the cli command:
```
aws s3 sync d --sse --delete . s3://<bucket>
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket_acl | The canned ACL to apply. Defaults to private. | string | `private` | no |
| bucket_force_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | string | `false` | no |
| bucket_name | Name for the bucket. | string | `` | no |
| bucket_versioning | A state of versioning (documented below) | string | `false` | no |
| default_cache_behavior_allowed_methods | Controls whether CloudFront caches the response to requests using the specified HTTP methods. | string | `<list>` | no |
| default_cache_behavior_cached_methods | Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. | string | `<list>` | no |
| default_cache_behavior_compress | Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header (default: false). | string | `false` | no |
| default_root_object | The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL. | string | `index.html` | no |
| default_ttl | The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. Defaults to 1 day. | string | `86400` | no |
| dns_name | Domain for create route53 records, mandory by default. | string | `` | no |
| enable_route53_record |  | string | `true` | no |
| environment | Logical name of the environment. | string | - | yes |
| max_ttl | The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers. Defaults to 365 days. | string | `31536000` | no |
| min_ttl | The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds. | string | `0` | no |
| name | Logical name for the distribution. | string | - | yes |
| price_class | The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100 | string | `PriceClass_100` | no |
| restrictions_geo_restriction_location | The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist). | string | `<list>` | no |
| restrictions_geo_restriction_restriction_type | The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist. | string | `none` | no |
| ssl_certificate_arn | The certificate ARN for the provided domain. Be aware that for cloud front the certicate needs to be available in us-east-1. | string | `` | no |
| ssl_minimum_protocol_version | The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018. Default: TLSv1. | string | `TLSv1.2_2018` | no |
| subdomain | By default the environment name is used as subdomain, set this variable to use a custom subdomain. No dots are supported yet. | string | `` | no |
| tags | A map of tags to add to the resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudfront_bucket_arn | ARN of the bucket for serving content. |
| cloudfront_distribution | Cloudfront distribution (id, arn) |
| cloudfront_dns_record | The CloudFront DNS name |
| route53_dns_record | The Rounte53 DNS name attached to CloudFront. |


## Automated checks
Currently the automated checks are limited. In CI the following checks are done for the root and each example.
- lint: `terraform validate` and `terraform fmt`
- basic init / get check: `terraform init -get -backend=false -input=false`

## Philips Forest

This module is part of the Philips Forest.

```
                                                     ___                   _
                                                    / __\__  _ __ ___  ___| |_
                                                   / _\/ _ \| '__/ _ \/ __| __|
                                                  / / | (_) | | |  __/\__ \ |_
                                                  \/   \___/|_|  \___||___/\__|  

                                                                 Infrastructure
```

Talk to the forestkeepers in the `forest`-channel on Slack.

[![Slack](https://philips-software-slackin.now.sh/badge.svg)](https://philips-software-slackin.now.sh)
