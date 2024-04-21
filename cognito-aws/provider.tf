terraform {
  required_providers {
    aws = {
      version = "5.7.0"
    }
  }
}

provider "aws" {
  region = var.region
}