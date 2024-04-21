data "aws_caller_identity" "current" {}

locals {
  tags = {
    "foo" = "bar"
  }
}

module "example" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "v1.6.0"

  repository_name = var.example-repository-name

  create_lifecycle_policy           = false
  repository_image_tag_mutability   = "MUTABLE"
  repository_read_write_access_arns = ["arn:aws:iam::number-of-your-account:root"]

  tags = merge(
    local.tags,
    {
      Name : var.example-repository-name
    }
  )
}

