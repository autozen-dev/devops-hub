resource "aws_instance" "gitlab_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_pair
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.gitlab_web.id]
  user_data                   = file("${path.module}/../scripts/install-gitlab.sh")
  user_data_replace_on_change = true

  root_block_device {
    volume_size           = 50
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "self-hosted-gitlab-server"
  }
}

resource "aws_ebs_volume" "gitlab_data_volume" {
  availability_zone = aws_subnet.public_subnet.availability_zone
  size              = 100
  type              = "gp3"

  tags = {
    Name = "self-hosted-gitlab-data-volume"
  }
}

resource "aws_volume_attachment" "gitlab_data_attachment" {
  device_name  = "/dev/xvdf"
  volume_id    = aws_ebs_volume.gitlab_data_volume.id
  instance_id  = aws_instance.gitlab_server.id
  force_detach = true
}