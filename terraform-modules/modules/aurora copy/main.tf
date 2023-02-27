resource "aws_rds_cluster" "postgresql" {
  cluster_identifier           = "liqi-custody"
  engine                       = "aurora-postgresql"
  engine_version               = "13.6"
  availability_zones           = ["us-east-1a", "us-east-1b"]
  database_name                = "mydb"
  master_username              = "foo"
  master_password              = "saparada"
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

  serverlessv2_scaling_configuration {
    max_capacity = 1.0
    min_capacity = 0.5
  }

  restore_to_point_in_time {
    source_cluster_identifier  = "liqi-custody"
    restore_type               = "copy-on-write"
    use_latest_restorable_time = true
  }
}


resource "aws_rds_cluster_instance" "example" {
  identifier                   = "liqi-custody-instance"
  cluster_identifier           = aws_rds_cluster.postgresql.id
  instance_class               = "db.serverless"
  engine                       = aws_rds_cluster.postgresql.engine
  engine_version               = aws_rds_cluster.postgresql.engine_version
  performance_insights_enabled = true
  database_name                = "mydb"
}


resource "aws_db_subnet_group" "aurora" {
  name       = "liqi-tass-aurora"
  subnet_ids = [var.subnet_id_rds_1a, var.subnet_id_rds_1b]

  tags = {
    Name = "production"
  }
}


resource "aws_security_group" "aurora" {
  name        = "teste-security-group-rds"
  description = "Allow Trafic from Internet"
  vpc_id      = var.vpc_id

  ingress {
    cidr_blocks = ["54.94.89.65/32"]
    description = "VPN-SSL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
  }


  ingress {
    cidr_blocks = [var.cidr_local]
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
    Name = "production"
  }

}