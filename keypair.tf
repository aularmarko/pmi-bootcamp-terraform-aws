resource "aws_key_pair" "key_demo" {
  key_name   = "Key for demo"
  public_key = file("${path.module}/key_demo.pub")
}