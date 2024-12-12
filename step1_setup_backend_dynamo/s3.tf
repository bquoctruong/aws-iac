# environments/sandbox/s3.tf

module "s3_terraform" {
  source = "../modules/s3"

  bucket_name       = var.backend_bucket_name
  tags              = var.tag
  enable_versioning = "true"
}
