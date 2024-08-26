#create database subnet
resource "aws_db_subnet_group" "database-subnet" {
  name       = "my-database-subnet-group"
  subnet_ids = [aws_subnet.rock-pub-sub-1.id, aws_subnet.rock-pub-sub-2.id, aws_subnet.rock-priv-sub-2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

#create rds database
resource "aws_db_instance" "myrds" {
  allocated_storage    = 20
  storage_type = "gp2"
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "youngdevopsengineer777"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  availability_zone = "eu-west-2c"
  db_subnet_group_name = aws_db_subnet_group.database-subnet.name
  vpc_security_group_ids = [aws_security_group.rds-security-group.id]


  tags = {
    Name = "myrdsdb"
  }
}