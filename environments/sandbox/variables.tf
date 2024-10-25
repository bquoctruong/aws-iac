# environments/dev/variables.tf

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = ""
}

variable "create_instance" {
  description = "Flag to create or destroy the EC2 instance"
  type        = bool
  default     = true
}
