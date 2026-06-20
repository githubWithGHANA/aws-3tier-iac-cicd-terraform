resource "aws_launch_template" "application_tier_lt" {
  name = "application-tier-LT"

  image_id      = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  key_name      = var.key_pair_name

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = base64encode(file("${path.module}/user-data/app-tier-user-data.sh"))

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "application-tier-instance"
    }
  }
}