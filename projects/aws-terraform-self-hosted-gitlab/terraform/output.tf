output "instance_id" {
  description = "ID of the GitLab EC2 instance"
  value       = aws_instance.gitlab_server.id
}

output "public_ip" {
  description = "Public IP address of the GitLab server"
  value       = aws_instance.gitlab_server.public_ip
}

output "gitlab_url" {
  description = "URL of the GitLab server"
  value       = "http://${aws_instance.gitlab_server.public_ip}"
}
