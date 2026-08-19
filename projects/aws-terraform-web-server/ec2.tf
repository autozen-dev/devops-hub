resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  key_name               = var.key_pair
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx
              systemctl start nginx

              echo "<h1>Hello from Terraform!</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "terraform-web-server"
  }
}