terraform {
  backend "s3" {
    bucket         = vars.s3_state
    key            = "terraform-ec2-instance/dev/terraform.tfstate"
    region         = vars.region
    dynamodb_table = "your-terraform-lock-table"
    encrypt        = true
  }
}
