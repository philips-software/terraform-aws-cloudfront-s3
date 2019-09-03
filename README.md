# Terraform module CloudFront Distribution for S3.

A terraform module to a CloudFront Distribution for serving content via a S3 bucket via HTTPS. By default the bucket is private.

By default a route53 record will be created for the provided dns_name. The subdomain is by default a combination of the `environment` and `name`, but can be overridden by providing a `subdomain`. The certificate needs to be a valid certificate and at least available in `us-east-1`.


## Terraform version

- Terraform 0.12: Pin module to `~> 2+`, submit pull request to branch `develop`
- Terraform 0.11: Pin module to `~> 1.x`, submit pull request to branch `terrafomr011`


## Example usages:
See also the [full examples](./examples).

```
module "cloudfront" {
  source = "github.com/philips-software/aws-terraform-cloudfront-s3?ref=terraform012"

  environment         = "forest"
  name                = "default"
  dns_name            = "mydomain.com"
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
| bucket\_acl | The canned ACL to apply. Defaults to private. | string | `"private"` | no |
| bucket\_force\_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | bool | `"false"` | no |
| bucket\_name | Name for the bucket. | string | `""` | no |
| bucket\_versioning | A state of versioning | bool | `"false"` | no |
| custom\_error\_response | One or more custom error response elements (multiples allowed), see https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#custom-error-response-arguments | list(map(string)) | `<list>` | no |
| default\_cache\_behavior\_allowed\_methods | Controls whether CloudFront caches the response to requests using the specified HTTP methods. | list(string) | `<list>` | no |
| default\_cache\_behavior\_cached\_methods | Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin. | list(string) | `<list>` | no |
| default\_cache\_behavior\_compress | Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header (default: false). | bool | `"false"` | no |
| default\_root\_object | The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL. | string | `"index.html"` | no |
| default\_ttl | The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. Defaults to 1 day. | number | `"86400"` | no |
| dns\_name | Domain for create route53 records, mandory by default. | string | `""` | no |
| enable\_route53\_record |  | bool | `"true"` | no |
| environment | Logical name of the environment. | string | n/a | yes |
| max\_ttl | The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers. Defaults to 365 days. | number | `"31536000"` | no |
| min\_ttl | The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds. | number | `"0"` | no |
| name | Logical name for the distribution. | string | n/a | yes |
| price\_class | The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100 | string | `"PriceClass_100"` | no |
| restrictions\_geo\_restriction\_location | The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist). | list | `<list>` | no |
| restrictions\_geo\_restriction\_restriction\_type | The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist. | string | `"none"` | no |
| ssl\_certificate\_arn | The certificate ARN for the provided domain. Be aware that for cloud front the certicate needs to be available in us-east-1. | string | `""` | no |
| ssl\_minimum\_protocol\_version | The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018. Default: TLSv1. | string | `"TLSv1.2_2018"` | no |
| subdomain | By default the environment name is used as subdomain, set this variable to use a custom subdomain. No dots are supported yet. | string | `""` | no |
| tags | A map of tags to add to the resources | map(string) | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudfront\_bucket\_arn | ARN of the bucket for serving content. |
| cloudfront\_distribution | Cloudfront distribution (id, arn) |
| cloudfront\_dns\_record | The CloudFront DNS name |
| route53\_dns\_record | The Rounte53 DNS name attached to CloudFront. |


## Automated checks
Currently the automated checks are limited. In CI the following checks are done for the root and each example.
- lint: `terraform validate` and `terraform fmt`
- basic init / get check: `terraform init -get -backend=false -input=false`

## Generation variable documentation
A markdown table for variables can be generated as follow. Generation requires awk and terraform-docs installed.

```
 .ci/bin/terraform-docs.sh markdown
```

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
