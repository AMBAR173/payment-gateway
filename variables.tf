variable "env" {
  type    = string
  default = "dev"
}

variable "region" {
  type        = string
  description = "AWS region for this workspace. Set this in each TFE workspace."
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  type        = string
  default     = null
  nullable    = true
  description = "Optional AZ for the subnet. If omitted, Terraform selects the first available AZ in the configured region."
}
