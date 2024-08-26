resource "aws_security_group" "lb-sg" {
  name        = "lb-sg"
  description = "Security group for load balancer"
  vpc_id = aws_vpc.rock-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    
  }

   

  tags = {
    Name = "lb-sg"
  }
}

#create security group for presentation tier instance
resource "aws_security_group" "server-sg" {
  name        = "server-sg"
  description = "Security group for instance"
  vpc_id = aws_vpc.rock-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
 

  }
  tags = {
   Name = "server-sg"
}
}

#create security group for application tier instance
resource "aws_security_group" "app-sg" {
  name        = "app-sg"
  description = "Security group for instance"
  vpc_id = aws_vpc.rock-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
 

  }
  tags = {
   Name = "app-sg"
}
}

#create security group for database tier
resource "aws_security_group" "rds-security-group" {
  name = "rds-security-group"
  description = "Allow inbound traffic on port 3306 for RDS"
  vpc_id = aws_vpc.rock-vpc.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
    
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS Security Group"
  }
  
}
  
