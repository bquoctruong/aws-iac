# environments/sandbox/variables.tf

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
}

# IAM variables
variable "iam_user_name" {
  description = "Name of the IAM user"
  type        = string
}

variable "iam_policy_arns" {
  description = "List of IAM policy ARNs to attach to the user"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
    "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicPowerUser",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchLambdaInsightsExecutionRolePolicy",
  ]
}

variable "create_access_key" {
  description = "Flag to create an access key for the IAM user"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = ""
}

variable "create_instance" {
  description = "Flag to create or destroy the EC2 instance"
  type        = bool
  default     = true
}

# S3 variables
variable "s3_bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
}

variable "s3_state" {
  description = "s3 bucket for state"
  type        = string
  default     = ""
}

variable "s3_demo" {
  description = "s3 bucket for state"
  type        = string
  default     = ""
}

variable "s3_acl" {
  description = "Canned ACL to apply to the S3 buckets"
  type        = string
  default     = "private"
}

variable "s3_enable_versioning" {
  description = "Whether to enable versioning on the S3 buckets"
  type        = bool
  default     = false
}

variable "s3_bucket_configs" {
  description = "Map of S3 bucket configurations"
  type = map(object({
    bucket_name       = string
    acl               = string
    enable_versioning = bool
    tags              = map(string)
  }))
}

variable "s3_tags" {
  description = "Common tags to apply to all S3 buckets"
  type        = map(string)
  default     = {
    Env = "dev"
  }
}
