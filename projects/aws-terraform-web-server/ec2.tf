resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  key_name               = var.key_pair
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl enable nginx
              systemctl start nginx

              echo "<h1>Hello from Terraform!</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "terraform-web-server"
  }
}