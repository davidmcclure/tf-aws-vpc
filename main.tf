provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = var.name
  }
}

resource "aws_internet_gateway" "vpc" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "vpc" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = var.aws_availability_zone

  tags = {
    Name = var.name
  }
}

resource "aws_route_table" "vpc" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc.id
  }

  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "vpc" {
  subnet_id      = aws_subnet.vpc.id
  route_table_id = aws_route_table.vpc.id
}
