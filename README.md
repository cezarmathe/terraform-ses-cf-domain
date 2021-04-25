# terraform-aws-ses-cf-domain

Configure a domain managed on Cloudflare for AWS SES.

## Cloudflare token required permissions

These are the required permissions that the token must have.

- `Zone:Read`
- `DNS:Edit`

## Inputs

- `zone`: zone of the domain (example: `example.com`, `example.net`)
- `domain`: the domain to configure for ses (examples: `example.com`,
`mail.example.net`)
- `create_dkim`: flag that indicates whether the DKIM configuration should be
created (default: `true`)

## Outputs

`this_arn`: ARN of the SES domain identity

## License

MIT
