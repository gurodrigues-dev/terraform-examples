resource "aws_cognito_user_pool" "example-shared" {
  alias_attributes          = [
    "preferred_username",
  ]
  deletion_protection       = "ACTIVE"
  mfa_configuration         = "OFF"
  name                      = "userpool-example-shared"
  tags                      = {
    "Enviroment" = "shared"
    "Name"       = "userpool-example-shared"
    "Terraform"  = "true"
  }
  tags_all                  = {
    "Enviroment" = "shared"
    "Name"       = "userpool-example-shared"
    "Terraform"  = "true"
  }

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  password_policy {
    minimum_length                   = 25
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
    }
  }
  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "gestorResponsavel"
    required                 = false

    string_attribute_constraints {
      max_length = "200"
      min_length = "5"
    }
  }

  username_configuration {
    case_sensitive = true
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
  }
}

resource "aws_cognito_user_pool_client" "client-userpool-example-shared" {
  access_token_validity                         = 60
  allowed_oauth_flows_user_pool_client          = false
  auth_session_validity                         = 3
  enable_propagate_additional_user_context_data = false
  enable_token_revocation                       = true
  explicit_auth_flows                           = [
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_USER_SRP_AUTH",
  ]
  id_token_validity                             = 60
  name                                          = "api-gateway"
  prevent_user_existence_errors                 = "LEGACY"
  read_attributes                               = [
    "address",
    "birthdate",
    "custom:codigo-empresa",
    "custom:gestorResponsavel",
    "email",
    "email_verified",
    "family_name",
    "gender",
    "given_name",
    "locale",
    "middle_name",
    "name",
    "nickname",
    "phone_number",
    "phone_number_verified",
    "picture",
    "preferred_username",
    "profile",
    "updated_at",
    "website",
    "zoneinfo",
  ]
  refresh_token_validity                        = 30
  user_pool_id                                  = aws_cognito_user_pool.example-shared.id
  write_attributes                              = [
    "address",
    "birthdate",
    "custom:codigo-empresa",
    "custom:gestorResponsavel",
    "email",
    "family_name",
    "gender",
    "given_name",
    "locale",
    "middle_name",
    "name",
    "nickname",
    "phone_number",
    "picture",
    "preferred_username",
    "profile",
    "updated_at",
    "website",
    "zoneinfo",
  ]

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }
}

resource "aws_cognito_user_group" "example-user" {
  description  = "example-user"
  name         = "example-user"
  user_pool_id = aws_cognito_user_pool.example-shared.id
}