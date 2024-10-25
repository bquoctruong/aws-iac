# environments/dev/outputs.tf

output "instance_public_ip" {
  value       = module.ec2_instance.instance_public_ip
  description = "Public IP of the EC2 instance"
  condition   = var.create_instance
}

output "instance_public_dns" {
  value       = module.ec2_instance.instance_public_dns
  description = "Public DNS of the EC2 instance"
  condition   = var.create_instance
}
