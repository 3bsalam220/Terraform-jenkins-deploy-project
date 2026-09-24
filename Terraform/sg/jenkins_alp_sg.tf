resource "aws_security_group" "Jenkins-alb" {
  description = "SG for ALB facing jenkines"
  name = "Jenkins-ALB-SG"
  vpc_id = var.VPC_id
  tags = {
    Name= "Jenkins-ALB-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "a" {
  security_group_id = aws_security_group.Jenkins-alb.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_ipv4 = "156.221.81.59/32"
}
resource "aws_vpc_security_group_egress_rule" "b" {
  security_group_id = aws_security_group.Jenkins-alb.id
  ip_protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_ipv4 = "0.0.0.0/0"
}