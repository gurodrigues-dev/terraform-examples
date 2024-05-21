locals {
    ## Generic Configuration
    environment = "<environment>"
    account = "<your-account-number>"
    region = "<your-region>"
    project_name = "<your-project-name>"
    author = "gurodrigues-dev"
        
    ## VPC
    security_group_ids = "<your-security-group-id>"  
    vpc_id = "<your-vpc-id>"                  
    subnet_ids = ["<subnet-private-1>", "<subnet-private-2>"]

    ## IAM
    lambda_function_role   = "${local.function_name}-role"
    lambda_function_policy = "${local.function_name}-policy"
    lambda_role_arn        = aws_iam_role.iam_for_lambda.arn

    ## Lambda
    lambda_filename        = "lambda_function.zip"
    lambda_handler         = "br.com.gurodrigues-dev.lambda.ApplicationHandler" # replace to your handler
    lambda_runtime         = "java17"
    lambda_memory_size     = 512 # replace to your choose
    lambda_timeout         = 180 # replace to your choose
    function_name          = "lambda-aws-default"

    ## Tags
    common_tags = {
        terraform   = "true"
        CreatedBy   = local.author
        Environment = local.environment
        ProjectName = local.project_name
    }

    ## Environments
    var_environment = {
        FOO = "BAR"
    }

}