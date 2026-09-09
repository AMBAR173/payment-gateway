output "subnet_id" {
  value = aws_subnet.payedge_vpc.id
}

output "internet_gateway_id" {
  value = module.payedge_vpc.internet_gateway_id
}