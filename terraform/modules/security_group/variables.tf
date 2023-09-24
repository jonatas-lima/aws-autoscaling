variable "ingress_config" {
  type = list(object({
    from_port   = number
    to_port     = number
    cidr_blocks = list(string)
    protocol    = string
  }))
  description = "Lista de regras de inbound."
  default     = []
}

variable "egress_config" {
  type = list(object({
    from_port   = number
    to_port     = number
    cidr_blocks = list(string)
    protocol    = string
  }))
  description = "Lista de regras de outbound."
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC a ser associada ao Security Group."
}
