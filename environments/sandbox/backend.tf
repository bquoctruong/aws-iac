terraform {
  backend "s3" {
    bucket         = var.s3_state
    key            = "terraform-ec2-instance/dev/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "your-terraform-lock-table"
    encrypt        = true
  }
}
