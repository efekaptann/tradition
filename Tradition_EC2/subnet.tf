resource "aws_subnet" "ec2_subnet" {
  vpc_id                  = aws_vpc.ec2_vpc.id

  count                   = 2
  cidr_block              = element(var.cidr_blocks,count.index)

  map_public_ip_on_launch = true
  availability_zone       = element(var.zones,count.index)


}
