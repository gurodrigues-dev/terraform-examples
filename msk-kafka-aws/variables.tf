#- General
variable region {
  description = "aws region"
  type        = string

  default     = "us-east-1"
}

#- MSK
variable "msk_cluster_name" {
  description = "nome do cluster msk"
  type        = string
  default     = "example-name-msk-kafka"
}

variable "msk_cluster_security_group_name" {
  description = "nome do security group do cluster msk"
  type        = string
  default     = "example-name-msk-kafka-security-group"
}