variable "env" {
  type    = string
  default = "dev"
}

variable "change_number" {
  type        = string
  description = "Approved change number required for sandbox changes"

  validation {
    condition     = can(regex("^CHG-[0-9]+$", trimspace(var.change_number)))
    error_message = "change_number must use the format CHG-12345."
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
