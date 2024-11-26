# aws-iac

Repository that controls all of my AWS Infrastructure utilizing Terraform and GitHub Actions

## Inputs

- `security_group_name`
- `vpc_id`
- `subnet_id`
- `ami_id`
- `instance_type`
- `key_name`
- `create_instance`
- `tags`

## Outputs

- `instance_public_ip`
- `instance_public_dns`

## Useful commands

`tofu fmt */*.tf`

Properly formats .tf files

`aws iam get-account-authorization-details > output.json`

Outputs current/existing iam user details in order to transpose details on terraform

`tofu init -backend-config=backend-config.hcl`

Initializes backend with .hcl; useful for init without revealing sensitive vars

`tofu import <RESOURCE>.<RESOURCE_NAME> <EXISTING_RESOURCE_NAME>`

imports existing resource into terraform approved resource

## TODO

- All AWS Always Free Tier Resources
  - Lambda
  - SNS
  - CloudWatch
  - CloudFront
  - Cognito
  - SQS
  - SWF
  - Glue
  - KMS
  - Step
  - Storage
  - X-Ray
  - CodeArtifact
  - CloudTrail
  - Prometheus
  - SimpleDB
  - Route53
  - HealthLake
  

- Clamped down IAM user

- Reformat modules to be reusable as opposed to...whatever it is