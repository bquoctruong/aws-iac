# modules/ec2_instance/outputs.tf

output "instance_public_ip" {
  value       = aws_instance.ec2_instance[0].public_ip
  description = "Public IP of the EC2 instance"
  condition   = var.create_instance
}

output "instance_public_dns" {
  value       = aws_instance.ec2_instance[0].public_dns
  description = "Public DNS of the EC2 instance"
  condition   = var.create_instance
}
