bucket         = "your-terraform-state-bucket"
key            = "terraform-ec2-instance/dev/terraform.tfstate"
region         = "us-west-2"
dynamodb_table = "your-terraform-lock-table"
encrypt        = true