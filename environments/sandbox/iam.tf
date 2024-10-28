# environments/sandbox/iam.tf

module "iam_user" {
  source = "../../modules/iam_user"

  user_name        = var.iam_user_name
  policy_arns      = var.iam_policy_arns
  create_access_key = var.create_access_key
}
