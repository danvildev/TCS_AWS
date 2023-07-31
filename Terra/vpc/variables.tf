variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  default     = "us-east-1"   
}

variable "vpc_cidr_block" {
  description = "CIDR Block de la VPC"
  default     = "10.200.0.0/16"
}
 