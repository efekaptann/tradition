resource "aws_route_table" "eks_rtb" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_gw.id
  }

  tags = {
    Name = "MyRoute"
  }
}

resource "aws_route_table_association" "a-1" {
  subnet_id      = aws_subnet.eks-public-1.id
  route_table_id = aws_route_table.eks_rtb.id
}

resource "aws_route_table_association" "a-2" {
  subnet_id      = aws_subnet.eks-public-2.id
  route_table_id = aws_route_table.eks_rtb.id
}

resource "aws_route_table_association" "a-3" {
  subnet_id      = aws_subnet.eks-public-3.id
  route_table_id = aws_route_table.eks_rtb.id
}