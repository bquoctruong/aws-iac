# modules/s3_bucket/main.tf

# Create an S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  # Apply server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.tags
}

# Enable versioning (optional)
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

# Enable logging (optional, but may incur costs if logging to another bucket)
# Omitted to stay within Free Tier constraints
