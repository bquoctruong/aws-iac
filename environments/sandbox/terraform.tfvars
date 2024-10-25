# environments/dev/terraform.tfvars

aws_region      = "us-west-2"
instance_type   = "t2.micro"
key_name        = "your-key-pair-name"  # Replace with your key pair name
create_instance = true

# IAM user configuration
iam_user_name    = "dev_user"  # Replace as needed
create_access_key = false

# S3 bucket configurations
s3_bucket_configs = {
  "s3_bucket_1" = {
    bucket_name       = "my-dev-s3-bucket-unique-name-1"
    acl               = "private"
    enable_versioning = false
    tags              = { Project = "ProjectA" }
  }
  "s3_bucket_2" = {
    bucket_name       = "my-dev-s3-bucket-unique-name-2"
    acl               = "public-read"
    enable_versioning = true
    tags              = { Project = "ProjectB" }
  }
}