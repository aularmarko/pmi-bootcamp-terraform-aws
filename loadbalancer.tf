resource "aws_lb" "alb_demo" {
  name               = "alb_demo"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.subPublic1.id, aws_subnet.subPublic2.id]
  security_groups = [aws_security_group.sg_demoALB.id]
 
  tags = {
    Name = "Application Load Balancer for demo"
  }
}
 
# Target group
resource "aws_lb_target_group" "tg_demo" {
  name = "tg_demo"
  port = "80"
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc_demo.id
 
  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    path                = "/index.html"
    port = 80
    matcher = "200"
    interval            = 30
  }
}
 
# Listener
resource "aws_lb_listener" "lis_demo" {
  load_balancer_arn = aws_lb.alb_demo.arn
  port = "80"
  protocol = "HTTP"
 
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg_demo.arn
  }
}
 
# Add instance 1 to target group
resource "aws_lb_target_group_attachment" "tga_demo1" {
  target_group_arn = aws_lb_target_group.tg_demo.arn
  target_id        = aws_instance.ec2_demoApplication1.id
  port             = "80"
}
 
# Add instance 2 to target group
resource "aws_lb_target_group_attachment" "tga_demo2" {
  target_group_arn = aws_lb_target_group.tg_demo.arn
  target_id        = aws_instance.ec2_demoApplication2.id
  port             = "80"
}