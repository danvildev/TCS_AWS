# Crear el Internet Gateway

variable "vpc_id" {}
variable "public_subnet_zone1_id" {}
variable "public_subnet_zone2_id" {}
variable "app_subnet_zone1_id" {}
variable "app_subnet_zone2_id" {}
variable "data_subnet_zone1_id" {}
variable "data_subnet_zone2_id" {}


resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "InternetGateway"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Asociar tabla de enrutamiento

 #ZONA 1
resource "aws_route_table_association" "public_subnet_zone1" {
  subnet_id      = var.public_subnet_zone1_id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "app_subnet_zone1" {
  subnet_id      = var.app_subnet_zone1_id
  route_table_id = aws_route_table.route_table.id
}
resource "aws_route_table_association" "data_subnet_zone1" {
  subnet_id      = var.data_subnet_zone1_id
  route_table_id = aws_route_table.route_table.id
}

#ZONA 2
resource "aws_route_table_association" "public_subnet_zone2" {
  subnet_id      = var.public_subnet_zone2_id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "app_subnet_zone2" {
  subnet_id      = var.app_subnet_zone2_id
  route_table_id = aws_route_table.route_table.id
}
resource "aws_route_table_association" "data_subnet_zone2" {
  subnet_id      = var.data_subnet_zone2_id
  route_table_id = aws_route_table.route_table.id
}