module "networking" {
  source = "./modules/networking"

  project_name         = var.project_name
  aws_region           = var.aws_region
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  common_tags          = var.common_tags
}

module "aurora" {
  source = "./modules/aurora"

  project_name             = var.project_name
  private_subnet_ids       = module.networking.private_subnet_ids
  aurora_security_group_id = module.networking.aurora_security_group_id

  database_name  = var.database_name
  master_username = var.master_username
  engine_version = var.engine_version

  min_capacity = var.min_capacity
  max_capacity = var.max_capacity

  common_tags = var.common_tags
}

module "lambda" {
  source = "./modules/lambda"

  project_name = var.project_name

  private_subnet_ids       = module.networking.private_subnet_ids
  lambda_security_group_id = module.networking.lambda_security_group_id

  aurora_endpoint = module.aurora.aurora_endpoint
  aurora_port     = module.aurora.aurora_port

  database_name          = var.database_name
  master_user_secret_arn = module.aurora.master_user_secret_arn

  common_tags = var.common_tags
}
