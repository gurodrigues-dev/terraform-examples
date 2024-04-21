resource "aws_sns_topic" "example" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "example_subscription" {
  topic_arn = aws_sns_topic.example.arn
  protocol  = "email"
  endpoint  = var.endpoint 
}