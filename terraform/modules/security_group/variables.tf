variable "create_ingress_cidr" {
  type        = bool
  description = "value"
}

variable "ingress_cidr_block" {
  type        = [string]
  description = "value"
}

variable "ingress_cidr_to_port" {
  type        = [string]
  description = "value"
}

variable "ingress_cidr_from_port" {
  type        = [string]
  description = "value"
}

variable "create_ingress_sg" {
  type        = [string]
  description = "value"
}

variable "ingress_sg_ids" {
  type        = [string]
  description = "value"
}

variable "ingress_sg_to_port" {
  type        = [string]
  description = "value"
}

variable "ingress_sg_from_port" {
  type        = [string]
  description = "value"
}

variable "create_egress_cidr" {
  type        = bool
  description = "value"
}

variable "egress_cidr_block" {
  type        = [string]
  description = "value"
}

variable "egress_cidr_to_port" {
  type        = [string]
  description = "value"
}

variable "egress_cidr_from_port" {
  type        = [string]
  description = "value"
}

variable "create_egress_sg" {
  type        = [string]
  description = "value"
}

variable "egress_sg_ids" {
  type        = [string]
  description = "value"
}

variable "egress_sg_to_port" {
  type        = [string]
  description = "value"
}

variable "egress_sg_from_port" {
  type        = [string]
  description = "value"
}
