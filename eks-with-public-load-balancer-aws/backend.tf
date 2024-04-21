terraform {
  backend "s3" {
    bucket  = "terraform-security-example-backend"
    key     = "eks-with-public-load-balancer-aws.tfstate"
    region  = "sa-east-1"
    encrypt = false
  }
}