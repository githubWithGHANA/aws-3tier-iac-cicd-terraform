resource "aws_launch_template" "web_tier_lt" {
  name          = "web-tier-LT"
  image_id      = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  key_name      = var.key_pair_name

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = base64encode(templatefile("${path.module}/user-data/web-tier-user-data.sh" , {
    alb_dns_name = aws_lb.app_alb.dns_name
    NGINX_CONF   = "/etc/nginx/nginx.conf" }))

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web-tier-instance"
    }
  }
}