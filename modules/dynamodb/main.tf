# modules/iam_user/main.tf

resource "aws_dynamodb_table" "dynamodb_tf_lock_table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 1 # Adjust within Free Tier limits
  write_capacity = 1 # Adjust within Free Tier limits
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
    Env  = var.environment
  }
}
