resource "aws_nat_gateway" "name" {
  allocation_id = aws_eip.First_Eip.id
  subnet_id = aws_subnet.puplic[0].id
  tags={
    Name="first nat"
  }
}
