variable "environment" {
  description = "Logical name of the environment."
  type        = "string"
}

variable "name" {
  description = "Logical name for the distribution."
  type        = "string"
}

variable "enable_route53_record" {
  default = true
}

variable "dns_name" {
  description = "Domain for create route53 records, mandory by default."
  type        = "string"
  default     = ""
}

variable "subdomain" {
  description = "By default the environment name is used as subdomain, set this variable to use a custom subdomain. No dots are supported yet."
  type        = "string"
  default     = ""
}

variable "ssl_certificate_arn" {
  description = "The certificate ARN for the provided domain. Be aware that for cloud front the certicate needs to be available in us-east-1."
  default     = ""
}

variable "min_ttl" {
  description = "The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated. Defaults to 0 seconds."
  default     = 0
}

variable "default_ttl" {
  description = "The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. Defaults to 1 day."
  default     = 86400
}

variable "max_ttl" {
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. Only effective in the presence of Cache-Control max-age, Cache-Control s-maxage, and Expires headers. Defaults to 365 days."
  default     = 31536000
}

variable "default_root_object" {
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  default     = "index.html"
}

variable "price_class" {
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  default     = "PriceClass_100"
}

variable "ssl_minimum_protocol_version" {
  default     = "TLSv1.2_2018"
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. One of SSLv3, TLSv1, TLSv1_2016, TLSv1.1_2016 or TLSv1.2_2018. Default: TLSv1. "
}

variable "tags" {
  type        = "map"
  description = "A map of tags to add to the resources"
  default     = {}
}

variable "default_cache_behavior_allowed_methods" {
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
  default     = ["GET", "HEAD"]
}

variable "default_cache_behavior_cached_methods" {
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
  default     = ["GET", "HEAD"]
}

variable "default_cache_behavior_compress" {
  description = "Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header (default: false)."
  default     = false
}

variable "restrictions_geo_restriction_location" {
  description = "The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)."
  default     = []
}

variable "restrictions_geo_restriction_restriction_type" {
  description = " The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
  default     = "none"
}

variable "bucket_name" {
  description = "Name for the bucket."
  default     = ""
}

variable "bucket_acl" {
  description = "The canned ACL to apply. Defaults to private."
  default     = "private"
}

variable "bucket_versioning" {
  description = "A state of versioning"
  default     = false
}

variable "bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  default     = false
}
