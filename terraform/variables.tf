variable "upscale_cooldown" {
  type        = number
  description = "Intervalo de tempo (em segundos) que o autoscaler deve esperar para poder agir novamenta após uma ação de upscale."
  default     = 120
}

variable "target_metric" {
  type    = string
  default = "ASGAverageCPUUtilization"
}

variable "target_metric_value" {
  type    = number
  default = 35
}
