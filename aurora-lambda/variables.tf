variable "aws_region" {
  description = "AWS region for this project"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name used to identify project resources"
  type        = string
  default     = "aurora-lambda-demo"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "common_tags" {
  description = "Common tags applied to project resources"
  type        = map(string)

  default = {
    Project     = "aurora-lambda-demo"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
