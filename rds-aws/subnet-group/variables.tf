variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "projectName" {
  type        = string
  description = "projectName"
  default     = "example"
}

variable "CreatedBy" {
  type        = string
  description = "CreatedBy"
  default     = "Terraform"
}