resource "aws_subnet" "puplic" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.${count.index + 1}.0/24"
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name= "puplic_subnet_${count.index}"
  }
}



resource "aws_subnet" "private" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.${count.index + 10}.0/24"
  availability_zone = var.azs[count.index]

  tags = {
    Name= "private_subnet_${count.index}"
  }
}
