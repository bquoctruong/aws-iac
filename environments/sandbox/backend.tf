terraform {
  backend "s3" {
    bucket         = ${{ variables.AWS_S3_TF }}
    key            = "terraform-ec2-instance/dev/terraform.tfstate"
    region         = ${{ secrets.AWS_REGION }}
    dynamodb_table = "your-terraform-lock-table"
    encrypt        = true
  }
}
