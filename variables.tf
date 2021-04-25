# selftechio/terraform-cf-ses-domain - variables.tf

variable "zone" {
  type        = string
  description = "Cloudflare zone that holds the domain."
}

variable "domain" {
  type        = string
  description = "Domain to configure for SES."
}

variable "create_dkim" {
  type        = bool
  description = "Create DKIM verification CNAME records."
  default     = true
}
