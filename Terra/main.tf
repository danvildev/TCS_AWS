# main.tf


 
module "vpc" {
  source = "./vpc"
}
 
module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
  
}
module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./internet_gateway"
  vpc_id = module.vpc.vpc_id
  public_subnet_zone1_id = module.subnets.public_subnet_zone1_id
  public_subnet_zone2_id = module.subnets.public_subnet_zone2_id
  data_subnet_zone1_id = module.subnets.data_subnet_zone1_id
  data_subnet_zone2_id = module.subnets.data_subnet_zone2_id
  app_subnet_zone1_id = module.subnets.app_subnet_zone1_id
  app_subnet_zone2_id = module.subnets.app_subnet_zone2_id
}

module "application_load_balancer" {
  vpc_id = module.vpc.vpc_id
  source = "./application_load_balancer"
  security_group_id = module.security_group.security_group_id
  public_subnet_zone1_id = module.subnets.public_subnet_zone1_id
  public_subnet_zone2_id = module.subnets.public_subnet_zone2_id
}

module "rds_data_subnet" {
  source = "./rds_data_subnet"
  security_group_id = module.security_group.security_group_id
  data_subnet_zone1_id = module.subnets.data_subnet_zone1_id
  data_subnet_zone2_id = module.subnets.data_subnet_zone2_id
 
}



module "natgateway_public_subnet" {
  source = "./natgateway_public_subnet"
  security_group_id = module.security_group.security_group_id
  public_subnet_zone1_id = module.subnets.public_subnet_zone1_id
  public_subnet_zone2_id = module.subnets.public_subnet_zone2_id
}
 