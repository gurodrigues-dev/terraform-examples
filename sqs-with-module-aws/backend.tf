terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "sqs-with-module-aws.tfstate"
    region  = "us-east-1"
    encrypt = false
  }
}