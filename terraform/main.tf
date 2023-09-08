terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/virtual_private_cloud"

  availability_zone       = var.availability_zone
  vpc_cidr_block          = "192.168.0.0/16"
  subnet_cidr_block       = "192.168.1.0/24"
  map_public_ip_on_launch = true
}

module "asg" {
  source = "./modules/autoscaling_group"
}

module "alb_security_group" {
  source = "./modules/security_group"

  create_ingress_cidr    = true
  ingress_cidr_block     = ["0.0.0.0/0"]
  ingress_cidr_from_port = [80]
  ingress_cidr_to_port   = [80]
}

module "alb" {
  source = "./modules/application_load_balancer"

  alb_security_groups_ids = [module.alb_security_group.security_groups_ids]
}
