
resource "aws_s3_bucket" "athena_results" {
  bucket = "example-compliance-athena-s3"
}

resource "aws_athena_database" "example-name-athena-db" {
  name   = "example_name_athena_db"
  bucket = aws_s3_bucket.athena_results.bucket
}

resource "aws_athena_named_query" "get_data_from_athena" {
  name        = "get_data_from_athena"
  database    = aws_athena_database.example-name-athena-db.name
  query       = "SELECT * FROM example_name_athena_db LIMIT 10;" 
}
