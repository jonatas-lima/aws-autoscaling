data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  name    = "main-vpc"
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  azs            = data.aws_availability_zones.available.names
  cidr           = "192.168.0.0/16"
  public_subnets = ["192.168.1.0/24", "192.168.2.0/24"]

  map_public_ip_on_launch = true
  enable_dns_hostnames    = true
  enable_dns_support      = true
}

module "alb_security_group" {
  source = "./modules/security_group"

  egress_config = [
    {
      from_port   = 0
      to_port     = 0
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "-1"
    }
  ]

  ingress_config = [
    {
      from_port   = 80
      to_port     = 80
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "tcp"
    },
    {
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "tcp"
    }
  ]

  vpc_id = module.vpc.vpc_id
}

module "launch_template" {
  source = "./modules/launch_template"

  # If different, replace
  # public_key_path = "~/.ssh/id_rsa.pub"

  image_id            = "ami-0c38efb4f5f15205f"
  instance_type       = "t2.micro"
  security_groups_ids = [module.alb_security_group.security_group_id]
}

module "alb" {
  source = "./modules/application_load_balancer"

  alb_security_groups_ids   = [module.alb_security_group.security_group_id]
  alb_subnet_ids            = module.vpc.public_subnets
  alb_target_group_port     = 80
  alb_target_group_protocol = "HTTP"
  health_check_path         = "/health"
  health_check_port         = 80

  vpc_id                        = module.vpc.vpc_id
  load_balancing_algorithm_type = "round_robin"
}

module "asg" {
  source = "./modules/autoscaling_group"

  asg_desired_capacity = 1
  asg_max_size         = 3
  asg_min_size         = 1

  vpc_zone_identifier = module.vpc.public_subnets

  launch_template_id      = module.launch_template.launch_template_id
  launch_template_version = module.launch_template.launch_template_version

  alb_target_group = module.alb.target_group_arn

  upscale_target_metric    = var.upscale_target_metric
  upscale_metric_threshold = var.upscale_metric_threshold
}
