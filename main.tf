provider "aws" {
  region = var.region
}

resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Devlop enviornment VPC"
  }
}
