resource "aws_lambda_function" "lambda_function" {
  depends_on    = [ aws_iam_role.iam_for_lambda ]
  filename      = local.lambda_filename
  memory_size   = local.lambda_memory_size
  timeout       = local.lambda_timeout
  function_name = local.function_name
  runtime       = local.lambda_runtime
  handler       = local.lambda_handler
  environment {
    variables   = local.var_environment
  }
  role          = local.lambda_role_arn
  vpc_config {
    subnet_ids         = local.subnet_ids
    security_group_ids = ["${local.security_group_ids}"]
  }
  tags          = local.common_tags
}

