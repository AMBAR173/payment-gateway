provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  subnet_availability_zone = var.availability_zone != null ? var.availability_zone : data.aws_availability_zones.available.names[0]
}

resource "aws_vpc" "payedge_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name  = "Devlop enviornment VPC"
    Env   = "Dev"
    vpc   = "dev vpc"
    Owner = "Ambar"
    App   = "Payment-Gateway"
  }
}

resource "aws_subnet" "payedge_vpc" {
  vpc_id                  = aws_vpc.payedge_vpc.id
  cidr_block              = var.subnet_cidr
  availability_zone       = local.subnet_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-subnet-${local.subnet_availability_zone}"
    Env  = var.env
  }
}

module "payedge_vpc" {
  source = "./modules/vpc"

  vpc_id = aws_vpc.payedge_vpc.id
}
