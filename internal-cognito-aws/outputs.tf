output "client_secret" {
  value = aws_cognito_user_pool_client.internal-pld-client.client_secret
  sensitive = true
}