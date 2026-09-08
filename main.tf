provider "aws" {
  region = var.region
}

resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr
  tags = {
    Name  = "Devlop enviornment VPC"
    Env   = "Dev"
    vpc   = "dev vpc"
    Owner = "Ambar"
    App   = "Payment-Gateway"
  }
}

resource "aws_subnet" "dev" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-subnet-${var.availability_zone}"
    Env  = var.env
  }
}
