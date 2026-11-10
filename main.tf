
terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.72"
    }
  }
}
module "VPC" {
  source = "./modules/VPC"
}
module "ALB" {
  source = "./modules/ALB"

  vpc_id    = module.VPC.vpc_id
  subnet_ids = module.VPC.public_subnet_ids
}
