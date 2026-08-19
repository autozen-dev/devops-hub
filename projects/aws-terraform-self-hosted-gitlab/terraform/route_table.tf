resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.web_server_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_server_igw.id
  }

  tags = {
    Name = "self-hosted-gitlab-public-route-table"
  }
}