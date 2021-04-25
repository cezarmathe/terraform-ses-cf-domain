# selftechio/terraform-cf-ses-domain - outputs.tf

output "this_arn" {
  description = "ARN of the SES domain identity."
  value       = aws_ses_domain_identity.this.arn
}
