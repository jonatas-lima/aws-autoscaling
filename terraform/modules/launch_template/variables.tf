variable "security_groups_ids" {
  type        = list(string)
  description = "IDs dos Security Groups da instância."
}

variable "image_id" {
  type        = string
  description = "AMI da imagem a ser usada. Disponível em https://cloud-images.ubuntu.com/locator/ec2/"
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância provisionada. Disponível em https://aws.amazon.com/pt/ec2/instance-types/"
}

variable "public_key_path" {
  type        = string
  description = "Caminho para a chave SSH a ser adicionada na instância (default: ~/.ssh/id_rsa.pub)."
  default     = "~/.ssh/id_rsa.pub"
}
