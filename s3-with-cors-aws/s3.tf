resource "aws_s3_bucket" "example-s3" {
  bucket = "example-s3"
  tags = {
    CreatedBy        = "Terraform"
      }
}

resource "aws_s3_bucket_cors_configuration" "s3-bucket-cors" {

  bucket = aws_s3_bucket.example-s3.id
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = [""]
  }
  
}

resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.example-s3.id
  versioning_configuration {
    status = "Enabled"
  }
  depends_on = [aws_s3_bucket.example-s3]
}