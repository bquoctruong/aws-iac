# environments/sandbox/provider.tf

# Specify the AWS provider
provider "aws" {
  region          = var.aws_region
  iam_user_name   = var.iam_user_name
  s3_bucket_names = [var.s3_state, var.s3_demo]
  s3_state        = var.s3_state
  s3_demo         = var.s3_demo
}
