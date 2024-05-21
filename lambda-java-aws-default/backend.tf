terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "lambda-aws-default.tfstate"
    region  = "sa-east-1"
    encrypt = false
  }
}

terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "lambda-aws-default.tfstate"
    region  = "sa-east-1"
    encrypt = false
  }
}