resource "aws_eip" "eip_demo" {
  vpc = true
 
  tags = {
    Name = "eip_demo"
  }
}