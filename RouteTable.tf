resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_route_table
  }
}

resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.vpc.id


  tags = {
    Name = var.private_route_table
  }

}