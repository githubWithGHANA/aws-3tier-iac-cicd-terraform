# Public
resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
  tags                    = { Name = "PublicSubnet-1a" }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "192.168.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
  tags                    = { Name = "PublicSubnet-1b" }
}

# Web
resource "aws_subnet" "web_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "ap-south-1a"
  tags              = { Name = "PrivateSubnet-Web-1a" }
}

resource "aws_subnet" "web_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.4.0/24"
  availability_zone = "ap-south-1b"
  tags              = { Name = "PrivateSubnet-Web-1b" }
}

# App
resource "aws_subnet" "app_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.5.0/24"
  availability_zone = "ap-south-1a"
  tags              = { Name = "PrivateSubnet-App-1a" }
}

resource "aws_subnet" "app_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.6.0/24"
  availability_zone = "ap-south-1b"
  tags              = { Name = "PrivateSubnet-App-1b" }
}

# DB
resource "aws_subnet" "db_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.7.0/24"
  availability_zone = "ap-south-1a"
  tags              = { Name = "PrivateSubnet-Db-1a" }
}

resource "aws_subnet" "db_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.8.0/24"
  availability_zone = "ap-south-1b"
  tags              = { Name = "PrivateSubnet-Db-1b" }
}