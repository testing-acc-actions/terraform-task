resource "aws_iam_role" "lambda" {
  name = "${var.project_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-lambda-role"
  })
}

resource "aws_iam_role_policy_attachment" "lambda_vpc" {
  role = aws_iam_role.lambda.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy" "lambda_secrets" {
  name = "${var.project_name}-secrets-policy"
  role = aws_iam_role.lambda.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "secretsmanager:GetSecretValue"
        ]

        Resource = var.master_user_secret_arn
      }
    ]
  })
}

resource "aws_lambda_function" "aurora_handler" {
  function_name = "${var.project_name}-aurora-handler"

  role = aws_iam_role.lambda.arn

  runtime = "python3.12"
  handler = "handler.lambda_handler"

  filename         = "${path.root}/lambda/function.zip"
  source_code_hash = filebase64sha256("${path.root}/lambda/function.zip")

  timeout     = 30
  memory_size = 256

  vpc_config {
    subnet_ids         = var.private_subnet_ids
    security_group_ids = [var.lambda_security_group_id]
  }

  environment {
    variables = {
      DB_HOST       = var.aurora_endpoint
      DB_PORT       = tostring(var.aurora_port)
      DB_NAME       = var.database_name
      DB_SECRET_ARN = var.master_user_secret_arn
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.lambda_vpc,
    aws_iam_role_policy.lambda_secrets
  ]

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-aurora-handler"
  })
}
