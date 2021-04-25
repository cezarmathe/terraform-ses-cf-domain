# selftechio/terraform-cf-ses-domain - versions.tf

terraform {
  required_version = ">= 0.15"

  required_providers {
    aws = "~> 3"
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2"
    }
  }
}
