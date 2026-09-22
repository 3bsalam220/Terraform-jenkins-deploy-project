resource "aws_route_table" "puplic" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name="Puplic_rout_table"
  }
  
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name="private_rout_table"
  }
}