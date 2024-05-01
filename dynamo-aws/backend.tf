terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "dynamo-aws.tfstate"
    region  = "us-east-1"
    encrypt = false
  }
}