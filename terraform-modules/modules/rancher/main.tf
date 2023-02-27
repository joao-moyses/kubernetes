resource "aws_instance" "rancher" {
  ami                         = var.AMI["ubuntu"]
  instance_type               = var.INSTANCE_TYPE[1]
  key_name                    = "rancher"
  subnet_id                   = var.subnet_id_pub1a
vpc_security_group_ids      = [aws_security_group.internet_facing.id]
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"

  root_block_device {
    encrypted             = true
    delete_on_termination = true
    volume_size           = 20
    volume_type           = var.VOLUME_TYPE[0]
  }

  tags = {
    Name = "rancher"
    # Insira o nome da instância de sua preferência.
  }
}


resource "aws_security_group" "internet_facing" {
  name        = "${var.name}-internet_facing-security-group"
  description = "intenet_facing"
  vpc_id      = var.vpc_id

    tags = {
    Name = "${var.name}-internet_facing-security-group"
  }


  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "http"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
  
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    security_groups  = ["sg-083432279323d0530"]
  }


  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}



resource "aws_eip" "ec2" {
  vpc = true
}


resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.rancher.id
  allocation_id = aws_eip.ec2.id
}

  /*
  provisioner "remote-exec" {
    inline = [
        "sudo yum update -y",
        "sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2",
        "sudo yum install -y httpd mariadb-server",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "sudo usermod -a -G apache ec2-user",
        "sudo chown -R ec2-user:apache /var/www",
        "sudo chmod 2775 /var/www"   

 
    ]

   connection {
    host = self.public_ip
    type = "ssh"
    user = "ec2-user"
    private_key = file ("/home/exhange-prod/Downloads/oi.pem")

   }

  }




resource "aws_eip" "ec2" {
  vpc = true
}


resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2teste.id
  allocation_id = aws_eip.ec2.id
}


/*
module "ec2" {
  source = "../modules/ec2"
  name = var.NAME
  AMI = var.AMI
  INSTANCE_TYPE = var.INSTANCE_TYPE
  VOLUME_TYPE = var.VOLUME_TYPE
}*/
