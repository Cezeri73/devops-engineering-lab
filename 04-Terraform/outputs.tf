output "server_public_ip" {
  description = "Ubuntu EC2 sunucumuzun Public IP Adresi"
  value       = aws_instance.lab_server.public_ip
}