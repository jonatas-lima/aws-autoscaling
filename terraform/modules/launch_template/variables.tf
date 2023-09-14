variable "security_groups_ids" {
  type        = list(string)
  description = "value"
}

variable "image_id" {
  type        = string
  description = "value"
}

variable "instance_type" {
  type        = string
  description = "value"
}

variable "public_key_path" {
  type        = string
  description = "value"
  default     = "~/.ssh/id_rsa.pub"
}
