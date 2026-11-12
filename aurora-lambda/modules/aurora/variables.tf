variable "project_name" {
  description = "Name used to identify Aurora resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the Aurora DB subnet group"
  type        = list(string)
}

variable "aurora_security_group_id" {
  description = "Security group ID assigned to Aurora"
  type        = string
}

variable "database_name" {
  description = "Name of the initial PostgreSQL database"
  type        = string
}
variable "master_username" {
  description = "Master username for the Aurora database"
  type        = string
}

variable "engine_version" {
  description = "Aurora PostgreSQL engine version"
  type        = string
}

variable "min_capacity" {
  description = "Minimum Aurora Serverless v2 capacity in ACUs"
  type        = number
}

variable "max_capacity" {
  description = "Maximum Aurora Serverless v2 capacity in ACUs"
  type        = number
}

variable "common_tags" {
  description = "Common tags applied to Aurora resources"
  type        = map(string)
}
