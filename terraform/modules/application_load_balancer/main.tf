resource "aws_lb" "alb" {
  name               = "${var.application} - Application Load Balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_security_groups_ids
  subnets            = var.alb_subnet_ids
}

resource "aws_alb_target_group" "alb_tg" {
  port        = var.alb_target_group_port
  protocol    = var.alb_target_group_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  load_balancing_algorithm_type = var.load_balancing_algorithm_type
}

resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.arn
    type             = var.listener_type
  }
}
