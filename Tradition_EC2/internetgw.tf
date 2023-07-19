resource "aws_internet_gateway" "ec2_internet_gateway" {
  vpc_id = aws_vpc.ec2_vpc.id

  tags = {
    Name = "ec2_internet_gateway"
  }
}
