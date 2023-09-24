variable "vpc_zone_identifier" {
  type        = list(string)
  description = "Blocos CIDR disponível para upscale."
}

variable "asg_min_size" {
  type        = number
  description = "Número mínimo de instâncias em atividade."
  default     = 1
}

variable "asg_max_size" {
  type        = number
  description = "Número máximo de instâncias em atividade."
  default     = 3
}

variable "asg_desired_capacity" {
  type        = number
  description = "Número desejado de instâncias em atividade."
  default     = 1
}

variable "health_check_grace_period" {
  type        = number
  description = "Intervalo de tempo (em milissegundos) entre os healthchecks."
  default     = 300
}

variable "launch_template_id" {
  type        = string
  description = "ID do Launch Template usado no provisionamento das instâncias."
}

variable "launch_template_version" {
  type        = string
  description = "Versão do Launch Template usado no provisionamento das instâncias."
}

variable "alb_target_group" {
  type        = string
  description = "ARN do Target Group do Load Balancer associado."
}

variable "upscale_cooldown" {
  type        = number
  description = "Intervalo de tempo (em segundos) que o autoscaler deve esperar para poder agir novamenta após uma ação de upscale."
  default     = 120
}

variable "upscale_target_metric" {
  type        = string
  description = "Métrica alvo a ser considerada no upscale. Disponível em https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html"
}

variable "upscale_metric_threshold" {
  type        = number
  description = "Limite da métrica de upscale."
}

variable "upscale_evaluation_cycles" {
  type        = number
  description = "Número de ciclos de checagem de métricas a serem executados antes de tomar uma ação."
}

variable "upscale_evaluation_period" {
  type        = number
  description = "Intervalo de tempo entre os ciclos de checagem de métricas para upscale."
}

variable "upscale_comparison_operator" {
  type        = string
  description = "Operador de comparação a ser usado na avaliação de métricas para upscale. Possíveis valores em "
}

variable "upscale_statistic" {
  type        = string
  description = "Estatística a ser usada na avaliação de métricas para upscale. Possíveis valores em "
}

variable "downscale_cooldown" {
  type        = number
  description = "Intervalo de tempo (em segundos) que o autoscaler deve esperar para poder agir novamenta após uma ação de downscale."
  default     = 120
}

variable "downscale_target_metric" {
  type        = string
  description = "Métrica alvo a ser considerada no upscale. Disponível em https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html"
}

variable "downscale_metric_threshold" {
  type        = number
  description = "Limite da métrica de downscale."
}

variable "downscale_evaluation_cycles" {
  type        = number
  description = "Número de ciclos de checagem de métricas a serem executados antes de tomar uma ação de downscale."
}

variable "downscale_evaluation_period" {
  type        = number
  description = "Intervalo de tempo entre os ciclos de checagem de métricas para downscale."
}

variable "downscale_comparison_operator" {
  type        = string
  description = "Operador de comparação a ser usado na avaliação de métricas para downscale. Possíveis valores em "
}

variable "downscale_statistic" {
  type        = string
  description = "Estatística a ser usada na avaliação de métricas para downscale. Possíveis valores em "
}
