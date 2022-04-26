resource "aws_route_table_association" "public-route-table-asso" {
  subnet_id      = aws_subnet.public-subnets.id
  route_table_id = aws_route_table.public-route.id
}


resource "aws_route_table_association" "private-route-table-asso" {
  subnet_id      = aws_subnet.private-subnets.id
  route_table_id = aws_route_table.private-route.id
}