resource "aws_instance" "presentation" {
  ami = var.ami #Amazon Linux 2023 AMI
  instance_type = var.instance_type
  subnet_id = aws_subnet.rock-pub-sub-1.id
  security_groups = [aws_security_group.server-sg.id]
  user_data = filebase64("${path.module}/apache.sh")
  #keyname = aws_key_pair.deployer-key_name 
  associate_public_ip_address = true


  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    delete_on_termination = true
  }
  
  tags = {
    Name = "presenation-EC2"

}

}

#create application tier instance
resource "aws_instance" "application" {
  ami = var.ami #Amazon Linux 2023 AMI  
  instance_type = var.instance_type
  subnet_id = aws_subnet.rock-priv-sub-2.id
  security_groups = [aws_security_group.app-sg.id]
  #keyname = aws_key_pair.deployer-key_name 

tags = {
    Name = "application-EC2"

}

}