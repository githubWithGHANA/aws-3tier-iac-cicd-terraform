resource "aws_db_subnet_group" "tier_subnet_group" {
  name       = "tier-subnet-group"
  subnet_ids = [aws_subnet.db_1a.id, aws_subnet.db_1b.id]

  tags = {
    Name = "3tier-Subnet-Group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier = "nodeapp-mysql-db"
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.db_user
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.tier_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  publicly_accessible    = false
  storage_encrypted      = true
  skip_final_snapshot    = true #(skip snapshot), but remember in real projects you’ll mark as false
  tags = {
    Name = "nodeapp-mysql-db"
  }
}