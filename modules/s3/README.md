# S3 Bucket Module

This module creates an AWS S3 bucket with optional versioning and encryption.

## Inputs

- `bucket_name`: Name of the S3 bucket.
- `acl`: Access control list for the bucket (default: `private`).
- `enable_versioning`: Whether to enable versioning on the bucket (default: `false`).
- `tags`: Tags to apply to the bucket.

## Outputs

- `bucket_id`: ID of the S3 bucket.
- `bucket_arn`: ARN of the S3 bucket.
- `bucket_domain_name`: Domain name of the S3 bucket.
