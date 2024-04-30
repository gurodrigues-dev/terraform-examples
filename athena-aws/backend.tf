terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "athena-aws.tfstate"
    region  = "us-east-1"
    encrypt = false
  }
}