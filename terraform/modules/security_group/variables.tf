variable "create_ingress_cidr" {
  type        = bool
  description = "value"
  default     = false
}

variable "ingress_cidr_block" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "ingress_cidr_to_port" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "ingress_cidr_from_port" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "ingress_cidr_protocol" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "create_egress_cidr" {
  type        = bool
  description = "value"
  default     = false
}

variable "egress_cidr_block" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "egress_cidr_to_port" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "egress_cidr_from_port" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "egress_cidr_protocol" {
  type        = list(string)
  description = "value"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "value"
}
