resource "aws_internet_gateway" "Project_IGW" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name= "project_IGW"
  }
}