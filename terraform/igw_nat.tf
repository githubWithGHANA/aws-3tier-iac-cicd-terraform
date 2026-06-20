resource "aws_internet_gateway" "three_tier_igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "3-tier-project-IGW" }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags   = { Name = "3-tier-EIP" }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_1a.id
  tags          = { Name = "3-tier-project-NAT" }
}