# modules/iam_user/variables.tf

variable "user_name" {
  description = "Name of the IAM user"
  type        = string
}

variable "policy_arns" {
  description = "List of IAM policy ARNs to attach to the user"
  type        = list(string)
}

variable "create_access_key" {
  description = "Flag to create an access key for the user"
  type        = bool
  default     = false
}
