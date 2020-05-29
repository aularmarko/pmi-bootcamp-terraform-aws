# Public subnet 1
resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.vpc_demo.id
  cidr_block = var.sub_public1_cidr
  availability_zone = var.aws_az1
 
  tags = {
    Name = "public - demo - 1"
  }
}
 
# Public subnet 2
resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.vpc_demo.id
  cidr_block = var.public2_cidr
  availability_zone = var.aws_az2
 
  tags = {
    Name = "public - demo - 2"
  }
}