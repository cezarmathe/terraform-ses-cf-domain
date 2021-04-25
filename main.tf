# selftechio/cf-ses-domain - main.tf

data "cloudflare_zones" "this" {
  filter {
    name = var.zone
  }
}

resource "aws_ses_domain_identity" "this" {
  domain = var.domain
}

resource "cloudflare_record" "this_verification" {
  zone_id = local.zone_id
  name    = "_amazonses.${var.domain}"
  type    = "TXT"
  ttl     = 3600
  value   = aws_ses_domain_identity.this.verification_token
}

resource "aws_ses_domain_identity_verification" "this" {
  domain = aws_ses_domain_identity.this.id

  depends_on = [cloudflare_record.this_verification]
}

resource "aws_ses_domain_dkim" "this" {
  count = var.create_dkim ? 1 : 0

  domain = var.domain

  depends_on = [aws_ses_domain_identity_verification.this]
}

resource "cloudflare_record" "this_dkim" {
  count    = var.create_dkim ? 3 : 0

  zone_id = local.zone_id
  name    = "${aws_ses_domain_dkim.this[0].dkim_tokens[count.index]}._domainkey.${var.domain}"
  type    = "CNAME"
  ttl     = 3600
  value   = "${aws_ses_domain_dkim.this[0].dkim_tokens[count.index]}.dkim.amazonses.com"
}

locals {
  zone_data = one(data.cloudflare_zones.this.zones)
  zone_id   = lookup(local.zone_data, "id")
}
