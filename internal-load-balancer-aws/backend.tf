terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "cognito-aws.tfstate"
    region  = "sa-east-1"
    encrypt = false
  }
}