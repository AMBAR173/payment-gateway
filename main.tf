provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  availability_zone = coalesce(var.availability_zone, data.aws_availability_zones.available.names[0])
}

resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr
  tags = {
    Name  = "PayEdge Dev VPC"
    Env   = "Dev"
    vpc   = "dev vpc"
    Owner = "Ambar"
    App   = "Payment-Gateway"
  }
}

resource "aws_subnet" "dev" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.subnet_cidr
  availability_zone       = local.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-subnet-${local.availability_zone}"
    Env  = var.env
  }
}
