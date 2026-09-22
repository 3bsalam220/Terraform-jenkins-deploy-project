resource "aws_security_group" "APP-ALB-SG" {
  name = "APP-ALB-SG"
  vpc_id = var.VPC_id
  tags = {
    Name= "APP-ALB-SG"
  }
}
resource "aws_vpc_security_group_ingress_rule" "q" {
  security_group_id = aws_security_group.APP-ALB-SG.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_ipv4 = "0.0.0.0/0"
}
resource "aws_vpc_security_group_egress_rule" "w" {
  security_group_id =  aws_security_group.APP-ALB-SG.id
  ip_protocol = "-1"
  to_port = 0
  from_port = 0
  cidr_ipv4 = "0.0.0.0/0"
}