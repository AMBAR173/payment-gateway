output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}