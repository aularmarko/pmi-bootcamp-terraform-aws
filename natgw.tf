resource "aws_nat_gateway" "ngw_demo" {
  allocation_id = aws_eip.eip_demo.id
  subnet_id     = aws_subnet.public1.id
 
  tags = {
    Name = "ngw_demo"
  }
}