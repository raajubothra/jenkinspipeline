resource "aws_instance" "web-1" {
  ami                         = var.imagename
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "Devops"
  subnet_id                   = aws_subnet.public-subnets.id
  vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
  associate_public_ip_address = true
  tags = {
    Name  = "Server-1"
    Env   = "Production"
    Owner = "Raju Bothra"

  }
}
