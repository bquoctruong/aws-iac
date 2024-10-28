# modules/iam_user/outputs.tf

output "user_name" {
  value       = aws_iam_user.user.name
  description = "Name of the IAM user"
}

output "access_key_id" {
  value       = aws_iam_access_key.user_access_key[0].id
  description = "Access Key ID for the IAM user"
  # condition   = var.create_access_key
}

output "secret_access_key" {
  value       = aws_iam_access_key.user_access_key[0].secret
  description = "Secret Access Key for the IAM user"
  sensitive   = true
  # condition   = var.create_access_key
}
