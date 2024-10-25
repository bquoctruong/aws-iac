# environments/dev/provider.tf

# Specify the AWS provider
provider "aws" {
  region = var.aws_region
}
