resource "aws_vpc" "rock-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "rock-vpc"
  }
}

#create public subnets
resource "aws_subnet" "rock-pub-sub-1" {
  vpc_id     = aws_vpc.rock-vpc.id
  cidr_block = var.pub_subnet_1_cidr
   availability_zone = "eu-west-2a"
  tags = {
    Name = "rock-pub-sub-1"
  }
}
resource "aws_subnet" "rock-pub-sub-2" {
  vpc_id     = aws_vpc.rock-vpc.id
  cidr_block = var.pub_subnet_2_cidr
   availability_zone = "eu-west-2b"
  tags = {
    Name = "rock-pub-sub-2"
  }
}

#create private subnets
resource "aws_subnet" "rock-priv-sub-1" {
  vpc_id     = aws_vpc.rock-vpc.id
  cidr_block = var.priv_subnet_1_cidr
   availability_zone = "eu-west-2a"
  tags = {
    Name = "rock-priv-sub-1"
  }
  }
resource "aws_subnet" "rock-priv-sub-2" {
  vpc_id     = aws_vpc.rock-vpc.id
  cidr_block = var.priv_subnet_2_cidr
   availability_zone = "eu-west-2c"
  tags = {
    Name = "rock-priv-sub-2"
  }
}


#create public route table
resource "aws_route_table" "rock-pub-route-table" {
  vpc_id = aws_vpc.rock-vpc.id

  route = []

  tags = {
    Name = "rock-pub-route-table"
  }
}

#create private route table
resource "aws_route_table" "rock-priv-route-table" {
  vpc_id = aws_vpc.rock-vpc.id

  route = []

  tags = {
    Name = "rock-priv-route-table"
  }
}

#associate route table 
resource "aws_route_table_association" "public-route-1" {
  subnet_id      = aws_subnet.rock-pub-sub-1.id
  route_table_id = aws_route_table.rock-pub-route-table.id
}
resource "aws_route_table_association" "public-route-2" {
  subnet_id      = aws_subnet.rock-pub-sub-2.id
  route_table_id = aws_route_table.rock-pub-route-table.id
}
resource "aws_route_table_association" "private-route-1" {
  subnet_id      = aws_subnet.rock-priv-sub-1.id
  route_table_id = aws_route_table.rock-priv-route-table.id
}
resource "aws_route_table_association" "private-route-2" {
  subnet_id      = aws_subnet.rock-priv-sub-2.id
  route_table_id = aws_route_table.rock-priv-route-table.id
}

#create internet gateway
resource "aws_internet_gateway" "rock-igw" {
  vpc_id = aws_vpc.rock-vpc.id

  tags = {
    Name = "prod-igw"
  }
}

resource "aws_route" "public-internet-route" {
  route_table_id            = aws_route_table.rock-pub-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id   = aws_internet_gateway.rock-igw.id
}




