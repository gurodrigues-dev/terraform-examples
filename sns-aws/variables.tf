variable region {
  description = "aws region"
  type        = string

  default     = "us-east-1"
}

variable topic_name {
    description = "topic name"
    type = string
    default = "topic-name"
}

variable endpoint {
    description = "email destination"
    type = string
    default = "email@gmail.com"
}
