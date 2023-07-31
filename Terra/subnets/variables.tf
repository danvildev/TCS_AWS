 
variable "public_subnet_cidr_zone1" {
  description = "CIDR Block de la Subnet Pública en la Zona de Disponibilidad 1"
  default     = "10.200.1.0/24"
}

variable "app_subnet_cidr_zone1" {
  description = "CIDR Block de la Subnet de Aplicaciones en la Zona de Disponibilidad 1"
  default     = "10.200.10.0/24"
}

variable "data_subnet_cidr_zone1" {
  description = "CIDR Block de la Subnet de Datos en la Zona de Disponibilidad 1"
  default     = "10.200.100.0/24"
}

variable "public_subnet_cidr_zone2" {
  description = "CIDR Block de la Subnet Pública en la Zona de Disponibilidad 2"
  default     = "10.200.2.0/24"
}

variable "app_subnet_cidr_zone2" {
  description = "CIDR Block de la Subnet de Aplicaciones en la Zona de Disponibilidad 2"
  default     = "10.200.20.0/24"
}

variable "data_subnet_cidr_zone2" {
  description = "CIDR Block de la Subnet de Datos en la Zona de Disponibilidad 2"
  default     = "10.200.200.0/24"
}

 