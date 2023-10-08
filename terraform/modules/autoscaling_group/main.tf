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

resource "aws_autoscaling_policy" "upscale" {
  name                   = "upscale"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    target_value = var.target_metric_value
    predefined_metric_specification {
      predefined_metric_type = var.target_metric
    }
  }
}
