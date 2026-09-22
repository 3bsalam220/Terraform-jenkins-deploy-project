output "jenkins-alb-dns_public_ip" {
  value = aws_alb.Jenkins-alb.dns_name
}

output "app-alb-dns" {
  value = aws_alb.app_alb.dns_name
}
output "private-id" {
  value = aws_instance.private_ec2.id
}