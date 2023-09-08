resource "aws_launch_template" "app_launch_template" {
  name = "App Launch Template"

  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  placement {
    availability_zone = var.availability_zone
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_groups_ids
    subnet_id                   = var.subnet_id
  }

  user_data = file("./user_data.sh")
}

resource "aws_autoscaling_group" "asg" {
  name               = "${var.application} - Autoscaling Group"
  availability_zones = var.availability_zones
  min_size           = var.asg_min_size
  max_size           = var.asg_max_size
  desired_capacity   = var.desired_capacity

  health_check_type         = "ELB"
  health_check_grace_period = var.health_check_grace_period

  launch_template {
    id      = aws_launch_template.app_launch_template.id
    version = aws_launch_template.app_launch_template.latest_version
  }

  vpc_zone_identifier = var.vpc_subnets
}
