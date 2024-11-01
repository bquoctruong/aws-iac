# environments/sandbox/terraform.tfvars

aws_region      = var.aws_region
instance_type   = "t2.micro"
key_name        = "your-key-pair-name"  # Replace with your key pair name
create_instance = false

# IAM user configuration
iam_user_name    = var.iam_user_name
create_access_key = false

# S3 bucket configurations
s3_bucket_configs = {
  var.s3_state = {
    bucket_name       = var.s3_state
    acl               = "private"
    enable_versioning = false
    tags              = { Project = "ProjectA" }
  }
  var.s3_demo = {
    bucket_name       = var.s3_demo
    acl               = "public-read"
    enable_versioning = true
    tags              = { Project = "ProjectB" }
  }
}