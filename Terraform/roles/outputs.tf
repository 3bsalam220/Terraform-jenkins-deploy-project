output "jenkins_role" {
  value=aws_iam_instance_profile.jenkins_profile.name
}
output "private_ec2_role" {
  value = aws_iam_instance_profile.private_ec2_profile.name
}


output "jenkins_role-arn" {
  value=aws_iam_instance_profile.jenkins_profile.arn
}
output "private_ec2_role-arn" {
  value = aws_iam_instance_profile.private_ec2_profile.arn
}