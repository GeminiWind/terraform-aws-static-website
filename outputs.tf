output "website_url" {
  value = "https://${var.cname}.${var.domain}"
}

output "s3_bucket" {
  value = "${var.app}-site-bucket--stage-${var.stage}"
}
