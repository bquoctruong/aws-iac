# environments/sandbox/provider.tf

# Specify the AWS provider
provider "aws" {
  region = var.aws_region
}
