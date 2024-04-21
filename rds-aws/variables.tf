variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "projectName" {
  type        = string
  description = "projectName"
  default     = "Project"
}

variable "CreatedBy" {
  type        = string
  description = "Created By"
  default     = "Terraform"
}
variable "rds_db_name" {
  type    = string
  default = "nameexampledb"
}

variable "rds_port" {
  type    = number
  default = 5432
}
variable "rds_engine" {
  type    = string
  default = "postgres"
}