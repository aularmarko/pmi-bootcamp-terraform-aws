resource "aws_security_group" "sg_demoBastion" {
  name = "sgdemo - Bastion"
  description = "Allow access on port 22 from restricted IP"
  vpc_id = aws_vpc.vpc_demo.id
 
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ip_address]
  }
 
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "Allow access on port 22 from my IP"
  }
}
 
# Security group for application load balancer
resource "aws_security_group" "sg_demoALB" {
  name = "sg_demo - ALB"
  description = "Allow access on port 80 from everywhere"
  vpc_id = aws_vpc.vpc_demo.id
 
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "Allow HTTP access from everywhere"
  }
}
 
# Security group for application hosts
resource "aws_security_group" "sg_demoApplication" {
  name = "sg_demo - Application"
  description = "Allow access on ports 22 and 80"
  vpc_id = aws_vpc.vpc_demo.id
 
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.sub_public1_cidr]
  }
 
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.sg_demoALB.id]
  }
 
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "Allow access on ports 22 and 80"
  }
}