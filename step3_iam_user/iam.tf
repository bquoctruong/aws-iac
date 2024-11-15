# environments/sandbox/iam.tf

resource "aws_iam_user" "iam_user_github" {
name  = var.iam_name
tags   = var.tag
}
