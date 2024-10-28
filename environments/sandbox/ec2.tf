# environments/dev/ec2.tf

terraform {
  required_version = ">= 1.5.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.16"  # Specify your desired version
    }
  }
}

# Call the EC2 instance module
module "ec2_instance" {
  source = "../../modules/ec2_instance"

  security_group_name = "dev-ec2-instance-sg"
  vpc_id              = data.aws_vpc.default.id
  subnet_id           = data.aws_subnet_ids.default.ids[0]
  ami_id              = data.aws_ami.amazon_linux.id
  instance_type       = var.instance_type
  key_name            = var.key_name
  create_instance     = var.create_instance
  tags                = {
    Name = "DevEC2Instance"
    Env  = "dev"
  }
}
