#- General
variable region {
  description = "aws region"
  type        = string

  default     = "us-east-1"
}

#- DynamoDb
variable example_name_dynamo {
  description = "dynamo name"
  type        = string
  default     = "example-name-dynamo"
  
}