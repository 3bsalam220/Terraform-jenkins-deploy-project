output "Project_Vpc_cidr_Block" {
  value = aws_vpc.main.cidr_block
}
output "Puplic1_cidr_Block" {
  value = aws_subnet.puplic[0].cidr_block
}
output "Puplic2_cidr_Block" {
  value = aws_subnet.puplic[1].cidr_block
}

output "Private1_cidr_Block" {
  value = aws_subnet.private[0].cidr_block
}
output "Private2_cidr_Block" {
  value = aws_subnet.private[1].cidr_block
}
output "Project_Vpc_id" {
  value = aws_vpc.main.id
}
output "Puplic1_id" {
  value = aws_subnet.puplic[0].id
}
output "Puplic2_id" {
  value = aws_subnet.puplic[1].id
}

output "Private1_id" {
  value = aws_subnet.private[0].id
}
output "Private2_id" {
  value = aws_subnet.private[1].id
}