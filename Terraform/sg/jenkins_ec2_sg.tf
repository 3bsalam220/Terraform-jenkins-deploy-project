resource "aws_security_group" "Jenkins_ec2_sg" {
  vpc_id = var.VPC_id
  name = "Jenkins-EC2-SG"
  tags = {
    Name= "Jenkins-EC2-SG" 
  }
}
resource "aws_vpc_security_group_ingress_rule" "n" {
  security_group_id = aws_security_group.Jenkins_ec2_sg.id
  ip_protocol = "tcp"
  from_port = 8080
  to_port = 8080
  referenced_security_group_id = aws_security_group.Jenkins-alb.id
}
resource "aws_vpc_security_group_egress_rule" "m" {
  security_group_id = aws_security_group.Jenkins_ec2_sg.id
  ip_protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_ipv4 = "0.0.0.0/0"
}