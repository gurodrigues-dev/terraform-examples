locals {
  tags = {
    Terraform = "TRUE"
  }
}

module "example-name-dynamo" {
  source = "terraform-aws-modules/dynamodb-table/aws"
  version = "v4.0.0"

  name                        = var.example_name_dynamo
  table_class                 = "STANDARD"
  deletion_protection_enabled = true

  hash_key                    = "primary_key"
  range_key                   = "sort_key"

  attributes = [
    {
      name = "primary_key"
      type = "S"
    },

 {
      name = "sort_key"
      type = "S"
    },
  ]

  tags = merge(
    local.tags,
    {
      Name: var.example_name_dynamo
    }
  )
}