module "example-name" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "v4.0.2"

  name = "name"

  fifo_queue = true
  create_dlq = true

  tags                      = {
    Nome = "name"  
  }
}