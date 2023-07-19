resource "aws_route_table" "public_rt_ec2" {
  vpc_id = aws_vpc.ec2_vpc.id

  route {
    cidr_block   = "0.0.0.0/0"
    gateway_id   = aws_internet_gateway.ec2_internet_gateway.id
  }
}

resource "aws_route_table_association" "a-1" {
  subnet_id      = aws_subnet.ec2_subnet[0].id
  route_table_id = aws_route_table.public_rt_ec2.id
}

resource "aws_route_table_association" "a-2" {
  subnet_id      = aws_subnet.ec2_subnet[1].id
  route_table_id = aws_route_table.public_rt_ec2.id
}
