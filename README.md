# AWS S3 Static Website Terraform Module
 
Provision a static website hosted through S3 in AWS.

## Features

- Automatically creates SSL certificate to enable HTTPS for Cloudfront distribution (if no `cert_arn` is provided)
- Uses CloudFront to serve content
- Automatically create `Record Set` in Route53 to point to Cloudfront distribution


## Prerequisites
- Make sure you're aws keys are set up in `~/.aws/credentials` to run AWS CLI
- After provisioning is successful, set the domain's nameservers in your DNS Management to point to the AWS nameservers listed in the hosted zone 

## Usage

```HCL
module "static-website" {
  source  = "GeminiWind/static-website/aws"
  version = "1.0.0"

  region            = "ap-southeast-1"
  app               = "YOUR_APP_NAME"
  stage             = "YOUR_DEPLOY_STAGE, E.G: <dev, staging, prod>"
  
  artifact_dir      = "PATH_TO_YOUR_WEBSITE_ARTIFACT"
  index_page        = "INDEX_PAGE_PATH_FOR_YOUR_SITE"
  error_page        = "ERROR_PAGE_PATH_FOR_YOUR_SITE"
  enable_versioning = true
  
  cert_arn          = "ARN_OF_SSL_CERTIFICATE"

  domain            = "YOUR_ROOT_DOMAIN"
  cname             = "CNAME_RECORD"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| region | AWS Deployed Region (i.e. `ap-southeast-1`) | string | - | yes |
| app | App name | string | - | yes |
| stage | Deployed stage (i.e `dev`, `staging`, `prod`) | string | `dev` | yes |
| artifact_dir | Host directory containing your public file | string | - | yes |
| index_page | Path to point your index page | string | `index.html` | no |
| error_page | Path to point your error page | string | `index.html` | no |
| enable_versioning | Enable enable_versioning for bucket which serves your public file | bool | `false` | false |
| cert_arn | ARN of the SSL Certificate to use for the Cloudfront Distribution. If no value is provided, new certificate will be created automatically (in `us-east-1`) | string | - | no |
| domain | Root domain (i.e. `example.com`) | string | - | yes |
| cname | CNAME record (i.e. `blog`) | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| website_url | Website URL |

## Todos

[] Add custom tag from input

[] Add custom cache behavior for Cloudfront
