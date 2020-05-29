# Private subnet 1
resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.vpc_demo.id
  cidr_block = var.sub_private1_cidr
  availability_zone = var.aws_az1
 
  tags = {
    Name = "subPrivate - demo - 1"
  }
}
 
# Private subnet 2
resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.vpc_demo.id
  cidr_block = var.sub_private2_cidr
  availability_zone = var.aws_az2
 
  tags = {
    Name = "subPrivate - demo - 2"
  }
}