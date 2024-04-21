terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "ecr-wiht-module-aws.tfstate"
    region  = "us-east-1"
    encrypt = false
  }
}