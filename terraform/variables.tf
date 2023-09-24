variable "upscale_cooldown" {
  type        = number
  description = "Intervalo de tempo (em segundos) que o autoscaler deve esperar para poder agir novamenta após uma ação de upscale."
  default     = 120
}

variable "upscale_target_metric" {
  type        = string
  description = "Métrica alvo a ser considerada no upscale. Disponível em https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html"
  default     = "CPUUtilization"
}

variable "upscale_metric_threshold" {
  type        = number
  description = "Limite da métrica de upscale."
  default     = 50
}

variable "upscale_evaluation_cycles" {
  type        = number
  description = "Número de ciclos de checagem de métricas a serem executados antes de tomar uma ação."
  default     = 2
}

variable "upscale_evaluation_period" {
  type        = number
  description = "Intervalo de tempo entre os ciclos de checagem de métricas para upscale."
  default     = 30
}

variable "upscale_comparison_operator" {
  type        = string
  description = "Operador de comparação a ser usado na avaliação de métricas para upscale. Possíveis valores em "
  default     = "GreaterThanThreshold"
}

variable "upscale_statistic" {
  type        = string
  description = "Estatística a ser usada na avaliação de métricas para upscale. Possíveis valores em "
  default     = "Average"
}

variable "downscale_cooldown" {
  type        = number
  description = "Intervalo de tempo (em segundos) que o autoscaler deve esperar para poder agir novamenta após uma ação de downscale."
  default     = 120
}

variable "downscale_target_metric" {
  type        = string
  description = "Métrica alvo a ser considerada no upscale. Disponível em https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html"
  default     = "CPUUtilization"
}

variable "downscale_metric_threshold" {
  type        = number
  description = "Limite da métrica de downscale."
  default     = 20
}

variable "downscale_evaluation_cycles" {
  type        = number
  description = "Número de ciclos de checagem de métricas a serem executados antes de tomar uma ação de downscale."
  default     = 2
}

variable "downscale_evaluation_period" {
  type        = number
  description = "Intervalo de tempo entre os ciclos de checagem de métricas para downscale."
  default     = 30
}

variable "downscale_comparison_operator" {
  type        = string
  description = "Operador de comparação a ser usado na avaliação de métricas para downscale. Possíveis valores em "
  default     = "LessThanOrEqualToThreshold"
}

variable "downscale_statistic" {
  type        = string
  description = "Estatística a ser usada na avaliação de métricas para downscale. Possíveis valores em "
  default     = "Average"
}
