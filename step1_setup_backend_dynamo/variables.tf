# backend_setup/variables.tf

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-west-1"
}

variable "backend_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "tag" {
  type = map(string)
}
