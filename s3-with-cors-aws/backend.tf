terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "s3-with-cors.tfstate"
    region  = "sa-east-1"
    encrypt = false
  }
}