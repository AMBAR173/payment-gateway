variable "vpc_id" {
  type = string
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}