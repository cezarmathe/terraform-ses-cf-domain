# selftechio/cf-ses-domain - main.tf

variable "zone" {
  type        = string
  description = "Cloudflare zone of the domain."
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
