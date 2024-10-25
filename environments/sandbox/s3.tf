# environments/dev/s3.tf

module "s3_buckets" {
  source = "../../modules/s3_bucket"

  for_each = var.s3_bucket_configs

  bucket_name       = each.value.bucket_name
  acl               = each.value.acl
  enable_versioning = each.value.enable_versioning
  tags              = merge(var.s3_tags, each.value.tags, { Name = each.value.bucket_name })
}
