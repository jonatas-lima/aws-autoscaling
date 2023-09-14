variable "alb_security_groups_ids" {
  type        = list(string)
  description = "value"
}

variable "alb_subnet_ids" {
  type        = list(string)
  description = "value"
}

variable "alb_target_group_port" {
  type        = string
  description = "value"
}

variable "alb_target_group_protocol" {
  type        = string
  description = "value"
}

variable "vpc_id" {
  type        = string
  description = "value"
}

variable "health_check_path" {
  type        = string
  description = "value"
}

variable "health_check_port" {
  type        = string
  description = "value"
}

variable "load_balancing_algorithm_type" {
  type        = string
  description = "value"
}

variable "listener_protocol" {
  type        = string
  description = "value"
}

variable "listener_port" {
  type        = number
  description = "value"
}
