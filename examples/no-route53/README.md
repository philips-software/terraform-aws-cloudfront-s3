# CloudFront + S3 example

This example show the usages of the CloudFront S3 module. The example will create a cloud front distribution and S3 bucket. The example shows the following features.
- Private bucket
- *No* Route53 DNS name

## Prerequisites for running the example
Terraform is managed via the tool `tfenv`. Ensure you have installed [tfenv](https://github.com/kamatama41/tfenv). And install via tfenv the required terraform version as listed in `.terraform-version`

## Run the example

Just run the default terraform commands.


### Setup

```
terraform init
```

### Plan the changes and inspect

```
terraform plan
```

### Create the environment.

```
terraform apply
```

After the apply you can copy one or more files to the bucket.
```
cd html
aws s3 sync --sse --delete . s3://<bucket-name>
```


### Cleanup

```
terraform destroy
```
