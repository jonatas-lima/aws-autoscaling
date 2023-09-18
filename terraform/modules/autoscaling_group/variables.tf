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

variable "upscale_cooldown" {
  type        = number
  description = "value"
  default     = 120
}

variable "upscale_target_metric" {
  type        = string
  description = "value"
}

variable "upscale_metric_threshold" {
  type        = number
  description = "value"
}

variable "upscale_evaluation_periods" {
  type        = number
  description = "value"
}

variable "upscale_period" {
  type        = number
  description = "value"
}

variable "upscale_comparison_operator" {
  type        = string
  description = "value"
}

variable "upscale_statistic" {
  type        = string
  description = "value"
}

variable "downscale_cooldown" {
  type        = number
  description = "value"
  default     = 120
}

variable "downscale_target_metric" {
  type        = string
  description = "value"
}

variable "downscale_metric_threshold" {
  type        = number
  description = "value"
}

variable "downscale_evaluation_periods" {
  type        = number
  description = "value"
}

variable "downscale_period" {
  type        = number
  description = "value"
}

variable "downscale_comparison_operator" {
  type        = string
  description = "value"
}

variable "downscale_statistic" {
  type        = string
  description = "value"
}
