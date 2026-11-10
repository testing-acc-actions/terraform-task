
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
module "EC2" {
  source = "./modules/EC2"

  vpc_id                 = module.VPC.vpc_id
  subnet_id              = module.VPC.public_subnet_ids[0]
  alb_security_group_id  = module.ALB.security_group_id

  instance_type = var.instance_type
  ami_id        = var.ami_id
}
