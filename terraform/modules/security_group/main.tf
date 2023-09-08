resource "aws_security_group" "security_group" {
  name   = "${var.application} - Security Group"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.create_ingress_cidr ? toset(range(length(vars.ingress_cidr_from_port))) : []
    content {
      from_port   = var.ingress_cidr_from_port[ingress.key]
      to_port     = var.ingress_cidr_to_port[ingress.key]
      protocol    = var.ingress_cidr_protocol[ingress.key]
      cidr_blocks = var.ingress_cidr_block
    }
  }

  dynamic "ingress" {
    for_each = var.create_ingress_sg ? toset(range(length(vars.ingress_sg_from_port))) : []
    content {
      from_port       = var.ingress_sg_from_port
      to_port         = var.ingress_sg_to_port[ingress.key]
      protocol        = var.ingress_sg_protocol[ingress.key]
      security_groups = var.ingress_sg_ids
    }
  }

  dynamic "egress" {
    for_each = var.create_egress_cidr ? toset(range(length(var.egress_cidr_from_port))) : []
    content {
      from_port   = var.egress_cidr_from_port[egress.key]
      to_port     = var.egress_cidr_to_port[egress.key]
      protocol    = var.egress_cidr_protocol[egress.key]
      cidr_blocks = var.egress_cidr_block
    }
  }

  dynamic "egress" {
    for_each = var.create_egress_sg ? toset(range(length(var.egress_sg_from_port))) : []
    content {
      from_port       = var.egress_sg_from_port[egress.key]
      to_port         = var.egress_sg_to_port[egress.key]
      protocol        = var.egress_sg_protocol[egress.key]
      security_groups = var.egress_sg_ids
    }
  }
}
