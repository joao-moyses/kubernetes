resource "aws_docdb_cluster_instance" "cluster_instances" {
  count                = 1
  identifier           = "liqi-am-sandbox-docdb-inst-${count.index}"
  cluster_identifier   = aws_docdb_cluster.default.id
  instance_class       = var.list-docdb [0]
  apply_immediately    = true
  

  tags = {
    name       = "liqi-am-docdb-instace"
    environment = "sandbox"
  }
}


resource "aws_docdb_cluster" "default" {
  cluster_identifier = "liqi-am-sandbox"
  availability_zones = ["us-east-1a", "us-east-1b"]
  master_username    = "liqi"
  master_password    = "WR0tospothod9a8u7lc6"
  apply_immediately  = true
  engine_version       = "4.0.0"
  storage_encrypted   =  true
  deletion_protection = true
  preferred_backup_window         = "07:00-09:00"
  preferred_maintenance_window    = "mon:11:00-mon:12:00"
  backup_retention_period         = 31
  vpc_security_group_ids          = ["${aws_security_group.docdb.id}"]
  db_subnet_group_name            = (aws_docdb_subnet_group.default.id)
  skip_final_snapshot             = true



  tags = {
    name       = "liqi-am-docdb-cluser"
    environment = "sandbox"
  }

}

resource "aws_security_group" "docdb" {
  name        = "security-group-docdb"
  description = "allow vpn connectio to db"
  vpc_id      = "vpc-098e2dfc94f8c5b61"



  ingress {
    cidr_blocks = ["54.94.89.65/32"]
    description = "VPN-SSL"
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
  }

  
    ingress {
    cidr_blocks = ["10.75.0.0/20"]
    description = "local"
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
  }


  ingress {
    cidr_blocks = ["52.202.175.32/32"]
    description = "LIQI-POLLER-24X7"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }



  ingress {
    cidr_blocks = ["184.73.115.17/32"]
    description = "REDASH"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }


  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  
}


resource "aws_docdb_subnet_group" "default" {
  name       = "liqi-docdb-subnet-group"
  subnet_ids = ["subnet-0ca8fdc1a3e2a931f", "subnet-0c84b7e0a46b12aa0"]

  tags = {
    
    
    environment = "sandbox"
    
    
  }
}