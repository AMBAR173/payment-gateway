provider "aws" {
  region = var.region
}

resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr

  lifecycle {
    precondition {
      condition     = var.env != "sandbox" || can(regex("^CHG-[0-9]+$", trimspace(var.change_number)))
      error_message = "A valid change number is required before applying sandbox changes."
    }
  }

  tags = {
    Name         = "payment-vpc-${var.env}"
    ChangeNumber = var.change_number
  }
}
