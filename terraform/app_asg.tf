resource "aws_autoscaling_group" "application_tier_asg" {
  name = "application-tier-ASG"

  min_size         = var.asg_min     #change to ur requirement as it just for project practice purpose
  max_size         = var.asg_max
  desired_capacity = var.asg_desired

  vpc_zone_identifier = [
    aws_subnet.app_1a.id,
    aws_subnet.app_1b.id
  ]

  target_group_arns = [
    aws_lb_target_group.app_tg.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.application_tier_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "application-tier-asg-instance"
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

# #########
resource "aws_autoscaling_policy" "application_cpu_target" {
  name                   = "application-tier-cpu-scaling"
  autoscaling_group_name = aws_autoscaling_group.application_tier_asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 90.0
  }
}