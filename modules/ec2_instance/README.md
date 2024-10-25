# EC2 Instance Module

This module creates an EC2 instance along with a security group that allows SSH access.

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
