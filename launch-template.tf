resource "aws_launch_template" "rock-launch" {
  name_prefix   = "rock-launch"
  image_id      = var.amazon_machine_image
   instance_type = var.instance_type_lt
  #key_name = aws_key_pair.deployer-key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.server-sg.id]
  }

  block_device_mappings {
    device_name = "/dev/xvda"  # The device name must be specified
    ebs {
      volume_size = 8
      volume_type = "gp3"
    }
  }
  
  update_default_version = true
  user_data = filebase64("${path.module}/apache.sh")


  
  tag_specifications {
    resource_type ="instance"
    tags = {
      Name = "rock-launch"
  }
 
}
}

