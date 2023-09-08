variable "vpc_cidr_block" {
  type        = [string]
  description = "value"
}

variable "instance_tenancy" {
  type        = string
  description = "value"
}

variable "enable_dns_support" {
  type        = bool
  description = "value"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "value"
}

variable "availability_zone" {
  type        = string
  description = "value"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "value"
}

variable "subnet_cidr_block" {
  type        = string
  description = "value"
}
