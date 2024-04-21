terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "sns-aws.tfstate"
    region  = "us-east-1"
    encrypt = false
  }
}