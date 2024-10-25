# modules/iam_user/main.tf

# Create the IAM user
resource "aws_iam_user" "user" {
  name = var.user_name
}

# Attach policies to the user
resource "aws_iam_user_policy_attachment" "user_policy_attachments" {
  for_each   = toset(var.policy_arns)
  user       = aws_iam_user.user.name
  policy_arn = each.key
}

# Optionally create access keys
resource "aws_iam_access_key" "user_access_key" {
  count = var.create_access_key ? 1 : 0
  user  = aws_iam_user.user.name
}
