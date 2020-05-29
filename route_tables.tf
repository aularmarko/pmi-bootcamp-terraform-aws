resource "aws_route" "rtMainRoute" {
  route_table_id = aws_vpc.vpc_demo.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.ngw_demo.id
}
 
# Create public route table
resource "aws_route_table" "rtPublic" {
  vpc_id = aws_vpc.vpc_demo.id
 
  tags = {
    Name = "rtPublic - _demo"
  }
}
 
# Add route to Internet to public route table
resource "aws_route" "rtPublicRoute" {
  route_table_id = aws_route_table.rtPublic.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw_demo.id
}
 
# Associate public route table with public subnet 1
resource "aws_route_table_association" "rtPubAssoc1" {
  subnet_id   = aws_subnet.public1.id
  route_table_id = aws_route_table.rtPublic.id
}
 
# Associate public route table with public subnet 2
resource "aws_route_table_association" "rtPubAssoc2" {
  subnet_id   = aws_subnet.public2.id
  route_table_id = aws_route_table.rtPublic.id
}