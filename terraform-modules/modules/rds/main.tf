resource "aws_db_instance" "rds" {
  identifier                      = var.name
  instance_class                  = var.instance_type[0]
  allocated_storage               = 20
  max_allocated_storage           = 1000
  engine                          = "mysql"
  engine_version                  = "5.7"
  maintenance_window              = "Mon:05:37-Mon:06:07"
  backup_window                   = "04:22-04:52"
  username                        = "rancher"
  password                        = "hue12stat2519moncat1"
  publicly_accessible             = true
  skip_final_snapshot             = true
  db_subnet_group_name            = (aws_db_subnet_group.default.id)
  vpc_security_group_ids          = ["${aws_security_group.rds.id}"]
  multi_az                        = false
  storage_encrypted               = true 
  deletion_protection             = true 
  backup_retention_period         = 31
  copy_tags_to_snapshot           = true 
  apply_immediately               = true
  db_name                         = "cattle"
}

/*resource "aws_ssm_parameter" "pass" {
  name        = "/production/database/master/password/"
  description = "The parameter description"
  type        = "SecureString"
  value       = var.database_master_password

  tags = {
    environment = "production"
  }
}


resource "aws_ssm_parameter" "usr" {
  name        = "/production/database/master/username"
  description = "The parameter description"
  type        = "SecureString"
  value       = var.database_master_username

  tags = {
    environment = "production"
  }
}*/


resource "aws_db_subnet_group" "default" {
  name       = "${var.name}-db_subnet_group"
  subnet_ids = [var.subnet_id_rds_1a, var.subnet_id_rds_1b]

  tags = {
    Name = "${var.name}-db_subnet_group"
  }
}


resource "aws_security_group" "rds" {
  name        = "${var.name}-security-group-rds"
  description = "Allow Trafic from Internet"
  vpc_id      = var.vpc_id
  
    ingress {
    cidr_blocks = ["10.76.160.0/20"]
    description = "local"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
  }


  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}




