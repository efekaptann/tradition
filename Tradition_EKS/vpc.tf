resource "aws_vpc" "eks_vpc" {
  cidr_block = "10.3.0.0/16"

  tags = {
    Name = "Tradition-VPC"
  }
}