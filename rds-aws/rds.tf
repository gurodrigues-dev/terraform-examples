data "aws_caller_identity" "current" {}

data "aws_secretsmanager_secret_version" "example-db-credentials" {
  secret_id = "example-db-credentials"
}

locals {
  example-db-credentials = jsondecode(
    data.aws_secretsmanager_secret_version.example-db-credentials.secret_string
  )
}

data "aws_kms_key" "by_id" {
  key_id = "alias/example-manually-kms" 
}

resource "aws_db_instance" "db-example" {
  allocated_storage            = 400
  max_allocated_storage        = 1000
  storage_type                 = "gp3"
  engine                       = "postgres"
  engine_version               = "14.10"
  instance_class               = "db.m5d.xlarge"
  port                         = var.rds_port
  identifier                   = "example-db"
  username                     = local.example-db-credentials.username
  password                     = local.example-db-credentials.password
  db_name                      = var.rds_db_name
  backup_retention_period      = 7
  backup_window                = "04:00-04:30"
  performance_insights_enabled = true
  tags = {
    Name        = "db-authentication-rds-postgres"
    projectName = var.projectName
    CreatedBy   = var.CreatedBy
  }
  vpc_security_group_ids = ["id-vpc-sg"] 
  db_subnet_group_name   = "example-db-subnet-group"
  storage_encrypted      = true
  kms_key_id             = data.aws_kms_key.by_id.arn
  multi_az               = true
}