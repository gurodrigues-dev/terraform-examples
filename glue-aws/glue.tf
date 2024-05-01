data "aws_secretsmanager_secret_version" "example-name-glue-credentials" {
  secret_id = "example-name-glue-credentials"
}

locals {
  example-name-glue-credentials = jsondecode(
    data.aws_secretsmanager_secret_version.example-name-glue-credentials.secret_string
  )
}


resource "aws_security_group" "glue_sg" {
  name        = "glue-security-group"
  description = "Security group for AWS Glue to access the change (internal) database"
  vpc_id      = "your-vpc-id"

  ingress {
    from_port   = 7777 # number of your port
    to_port     = 7777
    protocol    = "tcp"
    cidr_blocks = ["cidr-vpc-ip"] // cidr of account
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    terraform   = "true"
  }
}

resource "aws_glue_connection" "glue_connection" {
  name = "glue-database-connection"

  connection_properties = {
    JDBC_CONNECTION_URL = "example-of-connection-to-mssql-server"
    USERNAME            = local.example-name-glue-credentials.username
    PASSWORD            = local.example-name-glue-credentials.password
    JDBC_ENFORCE_SSL    = "false"
  }

  physical_connection_requirements {
    availability_zone      = "us-east-1b"
    security_group_id_list = [aws_security_group.glue_sg.id]
    subnet_id            = "subnet-private-az1"
  }

  tags = {
    Terraform = true
  }
}
