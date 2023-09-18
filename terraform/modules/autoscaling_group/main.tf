resource "aws_autoscaling_group" "asg" {
  name             = " Autoscaling Group"
  min_size         = var.asg_min_size
  max_size         = var.asg_max_size
  desired_capacity = var.asg_desired_capacity

  vpc_zone_identifier = var.vpc_zone_identifier

  health_check_type         = "ELB"
  health_check_grace_period = var.health_check_grace_period

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }
}

resource "aws_autoscaling_attachment" "asg" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  lb_target_group_arn    = var.alb_target_group
}

resource "aws_autoscaling_policy" "downscale" {
  name                   = "downscale"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.downscale_cooldown
}

resource "aws_autoscaling_policy" "upscale" {
  name                   = "upscale"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.upscale_cooldown
}

resource "aws_cloudwatch_metric_alarm" "upscale" {
  alarm_name          = "upscale"
  alarm_actions       = [aws_autoscaling_policy.upscale.arn]
  namespace           = "AWS/EC2"
  comparison_operator = var.upscale_comparison_operator
  metric_name         = var.upscale_target_metric
  threshold           = var.upscale_metric_threshold
  evaluation_periods  = var.upscale_evaluation_periods
  period              = var.upscale_period
  statistic           = var.upscale_statistic

  dimensions = {
    AutoscalingGroupName = aws_autoscaling_group.asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "downscale" {
  alarm_name          = "downscale"
  alarm_actions       = [aws_autoscaling_policy.downscale.arn]
  namespace           = "AWS/EC2"
  comparison_operator = var.downscale_comparison_operator
  metric_name         = var.downscale_target_metric
  threshold           = var.downscale_metric_threshold
  evaluation_periods  = var.downscale_evaluation_periods
  period              = var.downscale_period
  statistic           = var.downscale_statistic

  dimensions = {
    AutoscalingGroupName = aws_autoscaling_group.asg.name
  }
}
