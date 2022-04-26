resource "aws_subnet" "public-subnets" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = var.public_subnet_name
  }
}


resource "aws_subnet" "private-subnets" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "us-east-1b"

  tags = {
    Name = var.private_subnet_name
  }
}