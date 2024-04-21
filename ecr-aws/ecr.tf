resource "aws_ecr_repository" "example-business-repository" {
  image_tag_mutability = "MUTABLE"
  name                 = "example-business"
  tags = {
    foo = "bar"
  }
  tags_all = {
    ping = "pong"
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = false
  }
}