# environments/sandbox/s3.tf

module "dynamodb_tf_lock_table" {
  source = "../modules/dynamodb"

  dynamodb_table_name           = var.dynamodb_table_name
  tags              = var.dynamodb_tag
}
