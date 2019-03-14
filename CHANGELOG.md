# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- Added output variable for cloudfront distribution id and arn

### Changed
- Updated terraform version and aws provider in the examples

## 1.1.0 - 2018-10-11
https://github.com/philips-software/terraform-aws-cloudfront-s3/tags/1.1.0
### Added
- Lifecycle rule in case versioning is enabled

### Changed
- Remove list permission from S3 policy
- Disable S3 website configuration

## 1.0.0
https://github.com/philips-software/terraform-aws-cloudfront-s3/tags/1.0.0
- Initial version

[Unreleased]: https://github.com/philips-software/terraform-aws-cloudfront-s3/compare/1.0.0...HEAD
[1.0.0]: https://github.com/philips-software/terraform-aws-cloudfront-s3/compare/1.0.0...1.1.0
