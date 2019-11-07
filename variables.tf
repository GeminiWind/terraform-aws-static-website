variable "region" {
  description = "AWS region to hosting your resources."
  default     = "ap-southeast-2"
  type        = "string"
}

variable "app" {
  description = "Name of your app."
  type        = "string"
}

variable "stage" {
  description = "Stage where app should be deployed like dev, staging or prod."
  default     = "dev"
  type        = "string"
}

variable "artifact_dir" {
  description = "Path to your static website"
  type        = "string"
}

variable "index_page" {
  description = "Index page path for your site, e.g: index.html."
  default     = "index.html"
  type        = "string"
}

variable "error_page" {
  description = "Error page path for your site, e.g: index.html."
  default     = "index.html"
  type        = "string"
}
variable "enable_versioning" {
  description = "Enable versioning for your S3 bucket to store artifact."
  default     = false
}

variable "cert_arn" {
  description = "ARN of the SSL Certificate to use for the Cloudfront Distribution"
  default     = ""
  type        = "string"
}

variable "domain" {
  description = "Your root domain, e.g: example.dev."
}

variable "cname" {
  description = "Name of CNAME record."
}
