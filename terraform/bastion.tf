resource "aws_instance" "bastion" {
  ami                    = "ami-051a31ab2f4d498f5" 
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_1a.id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion-host"
  }
}