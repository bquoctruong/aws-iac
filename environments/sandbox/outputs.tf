# environments/sandbox/outputs.tf

output "instance_public_ip" {
  value       = module.ec2_instance.instance_public_ip
  description = "Public IP of the EC2 instance"
  condition   = var.create_instance
}

output "instance_public_dns" {
  value       = module.ec2_instance.instance_public_dns
  description = "Public DNS of the EC2 instance"
  condition   = var.create_instance
}

# IAM user outputs
output "iam_user_name" {
  value       = module.iam_user.user_name
  description = "Name of the IAM user"
}

output "iam_access_key_id" {
  value       = module.iam_user.access_key_id
  description = "Access Key ID for the IAM user"
  condition   = var.create_access_key
}

output "iam_secret_access_key" {
  value       = module.iam_user.secret_access_key
  description = "Secret Access Key for the IAM user"
  sensitive   = true
  condition   = var.create_access_key
}

# S3 bucket outputs
output "s3_bucket_ids" {
  value       = { for k, m in module.s3_buckets : k => m.bucket_id }
  description = "IDs of the S3 buckets"
}

output "s3_bucket_arns" {
  value       = { for k, m in module.s3_buckets : k => m.bucket_arn }
  description = "ARNs of the S3 buckets"
}

output "s3_bucket_domain_names" {
  value       = { for k, m in module.s3_buckets : k => m.bucket_domain_name }
  description = "Domain names of the S3 buckets"
}