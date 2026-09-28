output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "security_group_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.web_sg.id
}

output "database_password" {
  description = "The database password"
  value       = var.db_password
  sensitive   = true
}