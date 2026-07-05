output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.django_server.public_ip
}

output "app_url" {
  description = "URL to access the Django app"
  value       = "http://${aws_instance.django_server.public_ip}:8001/todos"
}