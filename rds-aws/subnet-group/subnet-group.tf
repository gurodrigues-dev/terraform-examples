terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_db_subnet_group" "subnet-example-db" {
  name       = "example-db-subnet-group"
  subnet_ids = ["subnet-private-1", "subnet-private-2"]

  tags = {
    Name        = "example-db-subnet-group"
    projectName = var.projectName
    CreatedBy   = var.CreatedBy
  }
}