resource "aws_autoscaling_group" "rock-scaling" {
  desired_capacity   = 3
  max_size           = 5
  min_size           = 2
  health_check_type = "EC2"
  health_check_grace_period = 300
  default_cooldown = 30
  vpc_zone_identifier = ["${aws_subnet.rock-pub-sub-1.id}", "${aws_subnet.rock-pub-sub-2.id}"]  # Ensure this matches the launch template subnet

  launch_template {
    id = aws_launch_template.rock-launch.id
    version = "1"  # Specific numeric version that exists
  }


  tag {
    key                 = "Key"
    value               = "Value"
    propagate_at_launch = true
  }
}
