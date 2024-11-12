# backend_setup/main.tf

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "s3_terraform" {
  bucket = var.backend_bucket_name
  
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "Terraform State Bucket"
    Env  = var.environment
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_boc" {
  bucket = aws_s3_bucket.s3_terraform.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_dynamodb_table" "dynamodb_tf_lock_table" {
  name         = var.dynamodb_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 1  # Adjust within Free Tier limits
  write_capacity = 1  # Adjust within Free Tier limits
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
    Env  = var.environment
  }
}
