#Terraform Sample code
#TODO: Need to redstribute code into new files for ease.
#AWS VPC
resource "aws_vpc" "poc_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

#AWS Public Subnet
resource "aws_subnet" "poc_public_subnet" {
  vpc_id                  = aws_vpc.poc_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "dev-public"
  }
}

#AWS Internet Gateway
resource "aws_internet_gateway" "poc_internet_gateway" {
  vpc_id = aws_vpc.poc_vpc.id

  tags = {
    Name = "dev-igw"
  }
}

#AWS Route Table
resource "aws_route_table" "poc_public_rt" {
  vpc_id = aws_vpc.poc_vpc.id

  tags = {
    Name = "dev-public-rt"
  }
}

#AWS Route
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.poc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.poc_internet_gateway.id
}

#AWS Route Table Association
resource "aws_route_table_association" "poc_public_assoc" {
  subnet_id      = aws_subnet.poc_public_subnet.id
  route_table_id = aws_route_table.poc_public_rt.id
}

#AWS Key Pair
resource "aws_key_pair" "poc_auth" {
  key_name   = "pockey"
  public_key = file("~/.ssh/pockey.pub")
}