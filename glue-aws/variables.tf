variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "projectName" {
  type        = string
  description = "Nome do projeto atual"
  default     = "Project Name"
}

variable "CreatedBy" {
  type        = string
  description = "Autor do projeto"
  default     = "Terraform"
}