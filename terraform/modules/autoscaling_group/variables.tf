variable "vpc_zone_identifier" {
  type        = list(string)
  description = "value"
}

variable "asg_min_size" {
  type        = number
  description = "value"
  default     = 1
}

variable "asg_max_size" {
  type        = number
  description = "value"
  default     = 3
}

variable "asg_desired_capacity" {
  type        = number
  description = "value"
  default     = 1
}

variable "health_check_grace_period" {
  type        = number
  description = "value"
  default     = 300
}

variable "launch_template_id" {
  type        = string
  description = "value"
}

variable "launch_template_version" {
  type        = string
  description = "value"
}

variable "alb_target_group" {
  type        = string
  description = "value"
}
