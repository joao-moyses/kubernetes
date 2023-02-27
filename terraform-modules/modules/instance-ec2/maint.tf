resource "aws_instance" "ec2teste" {
  ami                         = var.AMI["amazon"]
  instance_type               = var.INSTANCE_TYPE[0]
  key_name                    = "teste"
  subnet_id                   = "subnet-05610f4d4c40fa101"
  vpc_security_group_ids      = ["sg-09da3e2195b019f8b"]
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"


  root_block_device {
    encrypted             = true
    delete_on_termination = true
    volume_size           = 20
    volume_type           = var.VOLUME_TYPE[0]
  }

  tags = {
    Name = "teste"
    # Insira o nome da instância de sua preferência.
  }

 
}
/*
resource "aws_eip" "ec2" {
  vpc = true
}


resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2teste.id
  allocation_id = aws_eip.ec2.id
}
*/

/*
module "ec2" {
  source = "../modules/ec2"
  name = var.NAME
  AMI = var.AMI
  INSTANCE_TYPE = var.INSTANCE_TYPE
  VOLUME_TYPE = var.VOLUME_TYPE
}*/