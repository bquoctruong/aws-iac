# environments/sandbox/terraform.tfvars

aws_region      = ${{ env.TF_REGION }}
instance_type   = "t2.micro"
key_name        = "your-key-pair-name"  # Replace with your key pair name
create_instance = true

# IAM user configuration
iam_user_name    = ${{ env.TF_IAM_USER_NAME }}
create_access_key = false

# S3 bucket configurations
s3_bucket_configs = {
  vars.s3_state = {
    bucket_name       = vars.s3_state
    acl               = "private"
    enable_versioning = false
    tags              = { Project = "ProjectA" }
  }
  ${{ env.TF_S3_DEMO }} = {
    bucket_name       = ${{ env.TF_S3_DEMO }}
    acl               = "public-read"
    enable_versioning = true
    tags              = { Project = "ProjectB" }
  }
}