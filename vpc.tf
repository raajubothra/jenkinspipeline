resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc_name
  }
}