resource "aws_lb_target_group" "rock-target" {
  name     = "rock-target"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  ip_address_type = "ipv4"
  vpc_id   = aws_vpc.rock-vpc.id
  depends_on = [aws_lb.my-load-balancer]

  

  health_check {
    enabled = true
    interval = 60
    timeout = 30
    healthy_threshold = 3
    unhealthy_threshold = 3
    path = "/healthcheck"
    matcher = "200-299"
  }

}

