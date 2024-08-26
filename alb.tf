#create load balancer
resource "aws_lb" "my-load-balancer" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [aws_subnet.rock-pub-sub-1.id, aws_subnet.rock-pub-sub-2.id]

}

#create listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.rock-target.arn
  }
}