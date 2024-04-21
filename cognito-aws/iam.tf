resource "aws_iam_role" "allow-sts-actions-on-cognito" {
  assume_role_policy    = jsonencode(
    {
      Statement = [
        {
          Action    = "sts:AssumeRole"
          Condition = {}
          Effect    = "Allow"
          Principal = {
            AWS = [
              "arn:aws:iam::number-of-account-will-used-1:root",
              "arn:aws:iam::number-of-account-will-used-2:root",
              "arn:aws:iam::number-of-account-will-used-3:root"
            ]
          }
        },
      ]
      Version   = "2012-10-17"
    }
  )
  managed_policy_arns   = [
    "arn:aws:iam::aws:policy/AmazonCognitoPowerUser",
  ]
  max_session_duration  = 3600
  name                  = "allow-sts-actions-on-cognito"
  path                  = "/"
}

resource "aws_iam_role_policy_attachment" "cognito-role" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
  role       = aws_iam_role.allow-sts-actions-on-cognito.name
}