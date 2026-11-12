data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-vpc"
  })
}


resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-${count.index + 1}"
    Type = "Private"
  })
}


resource "aws_security_group" "lambda" {
  name        = "${var.project_name}-lambda-sg"
  description = "Security group for Lambda function"
  vpc_id      = aws_vpc.main.id

  ingress = []
  egress  = []

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-lambda-sg"
  })
}

resource "aws_security_group" "aurora" {
  name        = "${var.proresource "aws_vpc_security_group_egress_rule" "lambda_to_aurora" {
  security_group_id            = aws_security_group.lambda.id
  referenced_security_group_id = aws_security_group.aurora.id

  ip_protocol = "tcp"
  from_port   = 5432
  to_port     = 5432

  description = "Allow Lambda to connect to Aurora PostgreSQL"
}ject_name}-aurora-sg"
  description = "Security group for Aurora PostgreSQL"
  vpc_id      = aws_vpc.main.id


resource "aws_vpc_security_group_ingress_rule" "aurora_from_lambda" {
  security_group_id            = aws_security_group.aurora.id
  referenced_security_group_id = aws_security_group.lambda.id

  ip_protocol = "tcp"
  from_port   = 5432
  to_port     = 5432

  description = "Allow PostgreSQL connections from Lambda only"
}

  ingress = []
  egress  = []

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-aurora-sg"
  })
}


module "networking" {
  source = "./modules/networking"

  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  private_subnet_cidrs  = var.private_subnet_cidrs
  common_tags           = var.common_tags
}
