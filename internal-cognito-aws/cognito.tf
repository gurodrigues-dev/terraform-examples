resource "aws_cognito_user_pool" "internal-example-cognito" {
  name = "userpool-internal-example-shared"

  deletion_protection = "INACTIVE"
  mfa_configuration   = "OFF"

  admin_create_user_config {
    allow_admin_create_user_only = true
  }

  alias_attributes = [
    "preferred_username",
  ]

  password_policy {
    minimum_length                   = 8
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 7
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "codigo-empresa"
    required                 = false

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }

  tags = {
    "Enviroment" = "nonprod"
    "Name"       = "userpool-internal-example-shared"
    "Terraform"  = "true"
  }
}

resource "aws_cognito_user_pool_client" "internal-example-client" {
  name                         = "client-internal-example-shared"
  user_pool_id                 = aws_cognito_user_pool.internal-example-cognito.id
  generate_secret              = true
  allowed_oauth_flows          = ["client_credentials"]
  supported_identity_providers = ["COGNITO"]

  depends_on = [
    aws_cognito_user_pool.internal-example-cognito
  ]
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = "userpool-internal-example-shared"
  user_pool_id = aws_cognito_user_pool.internal-example-cognito.id
}

resource "aws_cognito_resource_server" "resource" {
  identifier = "identifier"
  name       = "resource-server-identifier"

  scope {
    scope_name        = "squad-read"
    scope_description = "scope grants read-only (GET) access to the squad api"
  }

  scope {
    scope_name        = "squad-write"
    scope_description = "scope grants write (POST/PUT/DELETE) access to the squad api"
  }

  user_pool_id = aws_cognito_user_pool.internal-example-cognito.id
}

resource "aws_cognito_user_pool_client" "matera-credencials-nprod" {
  name                                 = "matera-nprod-internal-example-shared"
  user_pool_id                         = aws_cognito_user_pool.internal-example-cognito.id
  generate_secret                      = true
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["client_credentials"]
  allowed_oauth_scopes = ["identifier/squad-read", "identifier/squad-write"]
  supported_identity_providers         = ["COGNITO"]

  depends_on = [
    aws_cognito_user_pool.internal-example-cognito
  ]
}