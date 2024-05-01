terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "msk.tfstate"
    region  = "us-east-1"
    encrypt = false
  }
}