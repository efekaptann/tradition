resource "aws_subnet" "eks-public-1" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.3.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-sub-1"
  }
}

resource "aws_subnet" "eks-public-2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.3.2.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-sub-2"
  }
}

resource "aws_subnet" "eks-public-3" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.3.3.0/24"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-sub-3"
  }
}
