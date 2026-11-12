variable "project_name" {
  description = "Name used to identify networking resources"
  type        = string
}

variable "aws_region" {
  description = "AWS region for the VPC endpoint"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the project VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags applied to networking resources"
  type        = map(string)
}
