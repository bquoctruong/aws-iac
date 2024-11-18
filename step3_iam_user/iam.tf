# environments/sandbox/iam.tf

resource "aws_iam_user" "iam_user_github" {
name  = var.iam_name
tags   = var.tag
}

resource "aws_iam_access_key" "iam_user_github" {
  user = aws_iam_user.iam_user_github.name
}

data "aws_iam_policy_document" "iam_user_github_pd_allow" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
# assumerole
   statement {
       actions   = ["sts:AssumeRole"]
       principals {
            type    = "Service"
            identifiers = ["trustedadvisor.amazonaws.com", "support.amazonaws.com", "lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_user_policy" "iam_user_github_pd_allow" {
  name   = "iam_user_github_policy"
  user   = aws_iam_user.iam_user_github.name
  policy = data.aws_iam_policy_document.iam_user_github_pd_allow.json
}