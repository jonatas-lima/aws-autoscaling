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
  default     = 120
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

variable "target_metric" {
  type        = string
  description = "Métrica alvo a ser considerada. Disponível em https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy#predefined_scaling_metric_specification"
}

variable "target_metric_value" {
  type        = number
  description = "Valor alvo da métrica."
}
