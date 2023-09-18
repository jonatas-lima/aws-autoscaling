variable "alb_security_groups_ids" {
  type        = list(string)
  description = "IDs dos Security Groups vinculados."
}

variable "alb_subnet_ids" {
  type        = list(string)
  description = "IDs das subredes vinculadas."
}

variable "alb_target_group_port" {
  type        = string
  description = "Porta que o Target Group irá escutar (Porta que aplicação vai rodar nas instâncias)."
}

variable "alb_target_group_protocol" {
  type        = string
  default     = "HTTP"
  description = "Protocolo a ser usado na conexão com as instâncias (default: HTTP)"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC que o Load Balancer vai pertencer."
}

variable "health_check_path" {
  type        = string
  description = "Caminho para o healthcheck da aplicação. Exemplo: /health"
}

variable "health_check_port" {
  type        = string
  description = "Porta para ser usada no healthcheck."
}

variable "load_balancing_algorithm_type" {
  type        = string
  description = "Algoritmo de Load Balancing a ser usado. round_robin (fila circular) ou least_outstanding_requests (o Load Balancer envia a requisição para a instância com menos requisições pendentes)"
}
