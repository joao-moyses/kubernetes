
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
    protocol    = "tcp"
  }


  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}

