# modules/iam_user/variables.tf

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB Table"
  type        = string
}

variable "tags" {
  description = "List of IAM policy ARNs to attach to the user"
  type        = list(string)
}
