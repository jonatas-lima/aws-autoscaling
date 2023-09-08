resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.default.id
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  cidr_block              = var.subnet_cidr_block
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.default.id
}
