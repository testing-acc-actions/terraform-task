module "lambda" {
  source = "./modules/lambda"

  project_name = var.project_name

  private_subnet_ids = module.networking.private_subnet_ids

  lambda_security_group_id = module.networking.lambda_security_group_id

  aurora_endpoint = module.aurora.aurora_endpoint
  aurora_port     = module.aurora.aurora_port

  database_name = var.database_name

  master_user_secret_arn = module.aurora.master_user_secret_arn

  common_tags = var.common_tags
}
