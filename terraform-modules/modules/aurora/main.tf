resource "aws_rds_cluster" "postgresql" {
  cluster_identifier           = "liqi-legacy-cluster"
  engine                       = "aurora-postgresql"
  engine_version               = "13.6"
  availability_zones           = ["us-east-1a", "us-east-1b"]
  master_username              = "liqi"
  master_password              = "fasTLdlPRlspoZiFlthitA244"
  backup_retention_period      = 31
  preferred_backup_window      = "07:00-09:00"
  copy_tags_to_snapshot        = true
  apply_immediately            = true
  storage_encrypted            = true
  deletion_protection          = true
  preferred_maintenance_window = "Mon:05:37-Mon:06:07"
  vpc_security_group_ids       = ["${aws_security_group.aurora.id}"]
  db_subnet_group_name         = aws_db_subnet_group.aurora.id
  skip_final_snapshot  = true
  database_name           = "liqi"

  serverlessv2_scaling_configuration {
    max_capacity = 1.0
    min_capacity = 0.5
  }


  tags = {
    evironment = "production"
  }


}



resource "aws_rds_cluster_instance" "example" {
  cluster_identifier           = aws_rds_cluster.postgresql.id
  instance_class               = "db.serverless"
  engine                       = aws_rds_cluster.postgresql.engine
  engine_version               = aws_rds_cluster.postgresql.engine_version
  performance_insights_enabled = true
  identifier                   = "legacy"


  tags = {
    evironment = "production"
  }


}




resource "aws_rds_cluster" "postgresql1" {
  cluster_identifier           = "liqi-custody-cluster"
  engine                       = "aurora-postgresql"
  engine_version               = "13.6"
  availability_zones           = ["us-east-1a", "us-east-1b"]
  master_username              = "liqi"
  master_password              = "k07re29OPug3zlgogew4Cesta"
  backup_retention_period      = 31
  preferred_backup_window      = "07:00-09:00"
  copy_tags_to_snapshot        = true
  apply_immediately            = true
  storage_encrypted            = true
  deletion_protection          = true
  preferred_maintenance_window = "Mon:05:37-Mon:06:07"
  vpc_security_group_ids       = ["${aws_security_group.aurora.id}"]
  db_subnet_group_name         = aws_db_subnet_group.aurora.id
  skip_final_snapshot  = true
  database_name           = "liqi"

  serverlessv2_scaling_configuration {
    max_capacity = 1.0
    min_capacity = 0.5
  }


  tags = {
    evironment = "production"
  }


}



resource "aws_rds_cluster_instance" "example1" {
  cluster_identifier           = aws_rds_cluster.postgresql1.id
  instance_class               = "db.serverless"
  engine                       = aws_rds_cluster.postgresql1.engine
  engine_version               = aws_rds_cluster.postgresql1.engine_version
  performance_insights_enabled = true
  identifier                   = "custody"


  tags = {
    evironment = "production"
  }


}



resource "aws_db_subnet_group" "aurora" {
  name       = "liqi-custody-integration-rds"
  subnet_ids = ["subnet-08cb070c60fee6fcd", "subnet-0b6b6c58852bb4c9e"]

  tags = {
    evironment = "production"
  }
}







resource "aws_security_group" "aurora" {
  name        = "liqi-custody-integration-rds"
  description = "db security group"
  vpc_id      = "vpc-0063b3ebbb52d2ce0"

  ingress {
    cidr_blocks = ["54.94.89.65/32"]
    description = "VPN-SSL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
  }


  ingress {
    cidr_blocks = ["52.202.175.32/32"]
    description = "LIQI-POLLER-24X7"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
  }



  ingress {
    cidr_blocks = ["184.73.115.17/32"]
    description = "REDASH"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
  }



  ingress {
    cidr_blocks = ["10.75.80.0/20"]
    description = "local"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
  }


  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }


  tags = {
    Evironment = "production"
    Name       = "liqi-custody-integration-rds"
  }

}





/*
resource "aws_rds_cluster_endpoint" "eligible" {
  cluster_identifier          = aws_rds_cluster.postgresql.id
  cluster_endpoint_identifier = "reader"
  custom_endpoint_type        = "READER"

  excluded_members = [
    aws_rds_cluster_instance.test1.id,
    aws_rds_cluster_instance.test2.id,
  ]
}
*/
