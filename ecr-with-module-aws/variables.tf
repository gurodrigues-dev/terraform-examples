#- General
variable "region" {
  description = "aws region"
  type        = string

  default = "us-east-1"
}

#- ECR
variable "example-repository-name" {
  description = "nome do repositorio"
  type        = string
  default     = "example"
}
