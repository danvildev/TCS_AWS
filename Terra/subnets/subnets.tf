# subnets.tf

variable "vpc_id" {}

# Zona 1


resource "aws_subnet" "public_subnet_zone1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_zone1
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public_Subnet_Zone1"
  }
}

resource "aws_subnet" "app_subnet_zone1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.app_subnet_cidr_zone1
  availability_zone = "us-east-1a"

  tags = {
    Name = "App_Subnet_Zone1"
  }
}

resource "aws_subnet" "data_subnet_zone1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.data_subnet_cidr_zone1
  availability_zone = "us-east-1a"

  tags = {
    Name = "Data_Subnet_Zone1"
  }
}


#Zona 2


resource "aws_subnet" "public_subnet_zone2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_zone2
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public_Subnet_Zone2"
  }
}

resource "aws_subnet" "app_subnet_zone2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.app_subnet_cidr_zone2
  availability_zone = "us-east-1b"

  tags = {
    Name = "App_Subnet_Zone2"
  }
}

resource "aws_subnet" "data_subnet_zone2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.data_subnet_cidr_zone2
  availability_zone = "us-east-1b"

  tags = {
    Name = "Data_Subnet_Zone2"
  }
}
 

# OUTPUT Zona 1

output "public_subnet_zone1_id" {
  value = aws_subnet.public_subnet_zone1.id
}

output "app_subnet_zone1_id" {
  value = aws_subnet.app_subnet_zone1.id
}
output "data_subnet_zone1_id" {
  value = aws_subnet.data_subnet_zone1.id
}

 
# OUTPUT Zona 2

output "public_subnet_zone2_id" {
  value = aws_subnet.public_subnet_zone2.id
}
 

output "app_subnet_zone2_id" {
  value = aws_subnet.app_subnet_zone2.id
}

output "data_subnet_zone2_id" {
  value = aws_subnet.data_subnet_zone2.id
}
 