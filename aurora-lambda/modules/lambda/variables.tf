variable "project_name" {
  description = "Name used to identify Lambda resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for Lambda networking"
  type        = list(string)
}

variable "lambda_security_group_id" {
  description = "Security group ID assigned to Lambda"
  type        = string
}

variable "aurora_endpoint" {
  description = "Writer endpoint of Aurora PostgreSQL"
  type        = string
}

variable "aurora_port" {
  description = "Aurora PostgreSQL port"
  type        = number
}

variable "database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
}

variable "master_user_secret_arn" {
  description = "Secrets Manager ARN containing Aurora master credentials"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to Lambda resources"
  type        = map(string)
}
