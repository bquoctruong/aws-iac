# environments/sandbox/data.tf

# Fetch the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch the default subnet IDs
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
