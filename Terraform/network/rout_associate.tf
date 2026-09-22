
resource "aws_route_table_association" "puplic2_ass" {
  count = 2
  subnet_id = aws_subnet.puplic[count.index].id
  route_table_id = aws_route_table.puplic.id
}


resource "aws_route_table_association" "private2_ass" {
  count = 2
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}