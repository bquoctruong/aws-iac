# environments/sandbox/terraform.tfvars

aws_region      = ${{ secrets.AWS_REGION }}
instance_type   = "t2.micro"
key_name        = "your-key-pair-name"  # Replace with your key pair name
create_instance = true

# IAM user configuration
iam_user_name    = ${{ variables.AWS_IAM_USER_NAME }}
create_access_key = false

# S3 bucket configurations
s3_bucket_configs = {
  ${{ variables.AWS_S3_TF }} = {
    bucket_name       = ${{ variables.AWS_S3_TF }}
    acl               = "private"
    enable_versioning = false
    tags              = { Project = "ProjectA" }
  }
  ${{ variables.AWS_S3_DEMO }} = {
    bucket_name       = ${{ variables.AWS_S3_DEMO }}
    acl               = "public-read"
    enable_versioning = true
    tags              = { Project = "ProjectB" }
  }
}