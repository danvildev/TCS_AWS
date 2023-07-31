variable "public_subnet_zone1_id" {}
variable "public_subnet_zone2_id" {}
variable "security_group_id" {}

resource "aws_eip" "nat_eip_zone1" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway_zone1" {
  allocation_id = aws_eip.nat_eip_zone1.id
  subnet_id     = var.public_subnet_zone1_id
}

resource "aws_eip" "nat_eip_zone2" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway_zone2" {
  allocation_id = aws_eip.nat_eip_zone2.id
  subnet_id     = var.public_subnet_zone2_id
}

output "nat_gateway_zone1_id" {
  value = aws_nat_gateway.nat_gateway_zone1.id
}

output "nat_gateway_zone1_public_ip" {
  value = aws_nat_gateway.nat_gateway_zone1.public_ip
}

output "nat_gateway_zone2_id" {
  value = aws_nat_gateway.nat_gateway_zone2.id
}

output "nat_gateway_zone2_public_ip" {
  value = aws_nat_gateway.nat_gateway_zone2.public_ip
}
