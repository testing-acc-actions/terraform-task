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

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "CIDR ranges for private subnets"
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "database_name" {
  description = "Name of the Aurora PostgreSQL database"
  type        = string
  default     = "employee_db"
}

variable "master_username" {
  description = "Master username for Aurora PostgreSQL"
  type        = string
  default     = "dbadmin"
}

variable "engine_version" {
  description = "Aurora PostgreSQL engine version"
  type        = string
}

variable "min_capacity" {
  description = "Minimum Aurora Serverless v2 capacity in ACUs"
  type        = number
  default     = 0.5
}

variable "max_capacity" {
  description = "Maximum Aurora Serverless v2 capacity in ACUs"
  type        = number
  default     = 1
}
