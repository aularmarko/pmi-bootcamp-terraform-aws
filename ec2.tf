# ec2 instance - bastion host
resource "aws_instance" "ec2demoBastion" {
  ami = var.bastion_ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.keydemo.key_name
  vpc_security_group_ids = [aws_security_group.sgdemoBastion.id]
  subnet_id = aws_subnet.subPublic1.id
  associate_public_ip_address = true
 
  root_block_device {
    delete_on_termination = true
  }
 
  tags = {
    Name = "ec2demo - Bastion"
  }
}
 
# ec2 instance - app host 1
resource "aws_instance" "ec2demoApplication1" {
  ami = data.aws_ami.image.id
  instance_type = var.instance_type
  key_name = aws_key_pair.keydemo.key_name
  vpc_security_group_ids = [aws_security_group.sgdemoApplication.id]
  subnet_id = aws_subnet.subPrivate1.id
  associate_public_ip_address = false
 
  root_block_device {
    delete_on_termination = true
  }
 
  tags = {
    Name = "ec2demo - Application - 1"
  }
}
 
# ec2 instance - app host 2
resource "aws_instance" "ec2demoApplication2" {
  ami = data.aws_ami.image.id
  instance_type = var.instance_type
  key_name = aws_key_pair.keydemo.key_name
  vpc_security_group_ids = [aws_security_group.sgdemoApplication.id]
  subnet_id = aws_subnet.subPrivate2.id
  associate_public_ip_address = false
 
  root_block_device {
    delete_on_termination = true
  }
 
  tags = {
    Name = "ec2demo - Application - 2"
  }
}