# vpc.tf

 
resource "aws_vpc" "virginia" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "VPC_VIRGINIA"
    name = "VPC_Examen_AWS_TCS"
    env  = "Dev"
  }
}

output "vpc_id" {
  value = aws_vpc.virginia.id
}