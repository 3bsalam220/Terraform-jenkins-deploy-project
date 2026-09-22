resource "aws_route" "a" {
    route_table_id = aws_route_table.puplic.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.Project_IGW.id

}


resource "aws_route" "b" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.name.id
}