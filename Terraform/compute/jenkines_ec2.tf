resource "aws_instance" "jenkines_ec2" {
  ami = "ami-0bd3fbcdc633a1b1a"
  instance_type = "t3.micro"
  subnet_id = var.Puplic1_id
  vpc_security_group_ids =[var.jenkins_sg]
  iam_instance_profile = var.jenkins_role
  tags = {
    Name="jenkins"
  }
   root_block_device {
    volume_size = 25
    volume_type = "gp3"
  }
}
