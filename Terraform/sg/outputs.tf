output "app-alb-sg-id" {
  value = aws_security_group.APP-ALB-SG.id
}
output "jenkins-alb-sg-id" {
  value = aws_security_group.Jenkins-alb.id
}
output "jenkins-ec2-sg-id" {
  value = aws_security_group.Jenkins_ec2_sg.id
}
output "private-ec2-sg-id" {
  value = aws_security_group.private-EC2-SG.id
}