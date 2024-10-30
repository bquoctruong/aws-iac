terraform {
  backend "s3" {
    bucket         = ${{ env.TF_S3_STATE }}
    key            = "terraform-ec2-instance/dev/terraform.tfstate"
    region         = ${{ env.TF_REGION }}
    dynamodb_table = "your-terraform-lock-table"
    encrypt        = true
  }
}
