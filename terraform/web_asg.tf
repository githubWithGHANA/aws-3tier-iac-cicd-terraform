resource "aws_autoscaling_group" "web_tier_asg" {
  name = "web-tier-ASG"

  min_size         = var.asg_min     
  max_size         = var.asg_max
  desired_capacity = var.asg_desired

  vpc_zone_identifier = [
    aws_subnet.web_1a.id,
    aws_subnet.web_1b.id
  ]

  target_group_arns = [
    aws_lb_target_group.web_tg.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.web_tier_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web-tier-asg-instance"
    propagate_at_launch = true
  }

  enabled_metrics = [
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupTotalInstances"
  ]
}

#####
resource "aws_autoscaling_policy" "web_cpu_target" {
  name                   = "web-tier-cpu-scaling"
  autoscaling_group_name = aws_autoscaling_group.web_tier_asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 90.0
  }
}