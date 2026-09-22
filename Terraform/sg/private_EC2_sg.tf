resource "aws_security_group" "private-EC2-SG" {
  vpc_id = var.VPC_id
  name = "private-EC2-sg"
  tags = {
    Name ="private-EC2-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "k" {
  security_group_id = aws_security_group.private-EC2-SG.id
  ip_protocol = "tcp"
  from_port = 3000
  to_port = 3000
referenced_security_group_id =aws_security_group.APP-ALB-SG.id
}

resource "aws_vpc_security_group_egress_rule" "l" {
  security_group_id = aws_security_group.private-EC2-SG.id
  ip_protocol = "-1"
  to_port = 0
  from_port = 0
  
  cidr_ipv4 = "0.0.0.0/0"
}