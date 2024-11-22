# environments/sandbox/iam.tf

resource "aws_iam_user" "iam_user_github" {
  name = var.iam_name
  tags = var.tag
}

resource "aws_iam_access_key" "iam_user_github" {
  user = aws_iam_user.iam_user_github.name
}

resource "aws_iam_policy" "iam_policy_github" {
  name        = "iam_policy_github"
  description = "Policy for service account with basic permissions within Always Free Tier limits."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowS3BasicActions",
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = [
          "arn:aws:s3:::*",
          "arn:aws:s3:::*/*"
        ]
      },
      {
        Sid    = "AllowDynamoDBBasicActions",
        Effect = "Allow",
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem",
          "dynamodb:Scan",
          "dynamodb:Query",
          "dynamodb:UpdateItem"
        ],
        Resource = "arn:aws:dynamodb:*"
      },
      {
        Sid    = "AllowEC2ReadOnlyActions",
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeImages",
          "ec2:DescribeKeyPairs",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs"
        ],
        Resource = "*"
      },
      {
        Sid    = "AllowEC2StartStopActions",
        Effect = "Allow",
        Action = [
          "ec2:RunInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances"
        ],
        Resource = "*"
      },
      {
        Sid    = "AllowBasicCloudWatchActions",
        Effect = "Allow",
        Action = [
          "cloudwatch:PutMetricData",
          "cloudwatch:GetMetricStatistics",
          "cloudwatch:ListMetrics"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  user       = aws_iam_user.iam_user_github.name
  policy_arn = aws_iam_policy.iam_policy_github.arn
}


resource "aws_iam_role" "iam_role_github" {
  name = "iam_role_github"

  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "",
        Effect : "Allow",
        Action : "sts:AssumeRole",
        Principal : {
          Service : [
            "trustedadvisor.amazonaws.com",
            "support.amazonaws.com",
            "lambda.amazonaws.com"
          ]
        }
      }
    ]
  })
}

resource "aws_iam_user_policy" "iam_user_role_policy_attachment" {
  name = "ServiceAssumeRolePolicy"
  user = aws_iam_user.iam_user_github.name

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Sid : "AllowAssumeRole",
        Effect : "Allow",
        Action : "sts:AssumeRole",
        Resource : aws_iam_role.iam_role_github.arn
      }
    ]
  })
}

