terraform {
  backend "s3" {
    key            = "terraform-ec2-instance/dev/terraform.tfstate"
    dynamodb_table = "your-terraform-lock-table"
    encrypt        = true
  }
}
