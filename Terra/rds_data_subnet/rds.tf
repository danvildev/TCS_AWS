variable "data_subnet_zone1_id" {}
variable "data_subnet_zone2_id" {}
variable "security_group_id" {}

 
resource "aws_db_subnet_group" "master_db_subnet_group" {
  name       = "master-db-subnet-group"
  subnet_ids = [var.data_subnet_zone1_id, var.data_subnet_zone2_id]
}

  
resource "aws_db_instance" "master_db" {
  
  identifier             = "masterdb"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "12.15"
  instance_class         = "db.t2.micro"
  username               = "masterdbadmin"
  password               = "master!.!#"
  db_subnet_group_name   = aws_db_subnet_group.master_db_subnet_group.id
  vpc_security_group_ids = [var.security_group_id]

   
  backup_retention_period = 1
  backup_window          = "08:00-09:00"   

   
  tags = {
    Name        = "Master Database"
    Environment = "Production"
  }

  
  lifecycle {
    create_before_destroy = true
  }
}

# Zona disponibilidad B
resource "aws_db_instance" "read_replica_db" {
  
  identifier             = "readreplica"   
  engine                 = "postgres"
  instance_class         = "db.t2.micro"
  db_subnet_group_name   = aws_db_subnet_group.master_db_subnet_group.id
  vpc_security_group_ids = [var.security_group_id]
  replicate_source_db    = aws_db_instance.master_db.arn
  availability_zone      = "us-east-1b"
  depends_on = [aws_db_instance.master_db]

  tags = {
    Name        = "Read Replica Database"
    Environment = "Production"
  }
}