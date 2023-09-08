variable "alb_security_groups_ids" {
  type        = [string]
  description = "value"
}

variable "alb_subnet_ids" {
  type        = [string]
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

variable "target_type" {
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

variable "health_check_protocol" {
  type        = string
  description = "value"
}

variable "health_check_interval" {
  type        = number
  description = "value"
}

variable "health_check_timeout" {
  type        = number
  description = "value"
}

variable "health_check_healthy_threshold" {
  type        = number
  description = "value"
}

variable "health_check_unhealthy_threshold" {
  type        = number
  description = "value"
}

variable "listener_type" {
  type        = string
  description = "value"
}
