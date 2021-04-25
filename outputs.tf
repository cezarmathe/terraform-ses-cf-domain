# selftechio/cf-ses-domain - main.tf

output "this_arn" {
  description = "ARN of the SES domain identity."
  value       = aws_ses_domain_identity.this.arn
}
