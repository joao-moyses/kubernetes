

#nat_gateways


resource "aws_eip" "nat_gateway" {
  vpc = true

  tags = {
    Name = "${var.name}-eip-ngw1a"
  }
}


resource "aws_nat_gateway" "kubernetes" {
  allocation_id     = (aws_eip.nat_gateway.id)
  subnet_id         = var.subnet_id_pub1a
  connectivity_type = "public"
  tags = {
    Name = "${var.name}-ngw1a"
  }
}


resource "aws_eip" "nat_gateway1" {
  vpc = true

  tags = {
    Name = "${var.name}-eip-ngw1b"
  }
}


resource "aws_nat_gateway" "kubernetes1" {
  allocation_id     = (aws_eip.nat_gateway1.id)
  subnet_id         = var.subnet_id_pub1b
  connectivity_type = "public"
  tags = {
    Name = "${var.name}-ngw1b"
  }
}

#route tables


resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = (aws_nat_gateway.kubernetes.id)
  }

  tags = {
    Name = "${var.name}-private-route-table-1a"
  }
}

resource "aws_route_table" "private1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = (aws_nat_gateway.kubernetes1.id)
  }

  tags = {
    Name = "${var.name}-private-route-table-1b"
  }
}


resource "aws_route_table" "rds" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = (aws_nat_gateway.kubernetes.id)
  }

  tags = {
    Name = "${var.name}-private-rds-route-table-1a"
  }
}


resource "aws_route_table" "rds1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = (aws_nat_gateway.kubernetes1.id)
  }

  tags = {
    Name = "${var.name}-private-rds-route-table-1b"
  }
}





resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

  tags = {
    Name = "${var.name}-public-route-table"
  }
}


#association


resource "aws_route_table_association" "pr1" {
  subnet_id      = var.subnet_id_1a
  route_table_id = (aws_route_table.private.id)
}


resource "aws_route_table_association" "pr2" {
  subnet_id      = var.subnet_id_1b
  route_table_id = (aws_route_table.private1.id)
}


resource "aws_route_table_association" "pr3" {
  subnet_id      = var.subnet_id_rds_1a
  route_table_id = (aws_route_table.rds.id)
}


resource "aws_route_table_association" "pr4" {
  subnet_id      = var.subnet_id_rds_1b
  route_table_id = (aws_route_table.rds1.id)
}




resource "aws_route_table_association" "pub1" {
  subnet_id      = var.subnet_id_pub1a
  route_table_id = (aws_route_table.public.id)
}


resource "aws_route_table_association" "pub2" {
  subnet_id      = var.subnet_id_pub1b
  route_table_id = (aws_route_table.public.id)
}

/*
module "route" {
  source             = "../modules/route"
  vpc_id             = (aws_vpc.kubernetes.id)
  gateway_id         = (aws_internet_gateway.gw.id)
  name               = var.name
  subnet_id_pub1a    = (aws_subnet.public.id)
  subnet_id_pub1b    = (aws_subnet.public1.id)
  subnet_id1a        = (aws_subnet.private.id)
  subnet_id1b        = (aws_subnet.private1.id)
  subnet_id_rds_1a   = (aws_subnet.private2.id)
  subnet_id_rds_1b   = (aws_subnet.private3.id)
  subnet_id_docdb_1a = (aws_subnet.private4.id)
  subnet_id_docdb_1b = (aws_subnet.private5.id)

}
*/
