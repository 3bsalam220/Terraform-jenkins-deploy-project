resource "aws_instance" "private_ec2" {
  ami = "ami-0bd3fbcdc633a1b1a"
  instance_type = "t3.micro"
  associate_public_ip_address = false
  subnet_id = var.Private1_id
  vpc_security_group_ids = [var.private_sg]
  iam_instance_profile = var.private_role
  tags = {
    Name="private_ec2"
  }
   root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }
}