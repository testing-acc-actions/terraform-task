
resource "aws_db_subnet_group" "aurora" {
  name        = "${var.project_name}-aurora-subnet-group"
  description = "Private subnet group for Aurora PostgreSQL"

  subnet_ids = var.private_subnet_ids

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-aurora-subnet-group"
  })
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier = "${var.project_name}-aurora-cluster"

  engine         = "aurora-postgresql"
  engine_mode    = "provisioned"
  engine_version = var.engine_version

  database_name   = var.database_name
  master_username = var.master_username

  manage_master_user_password = true

  port = 5432

  db_subnet_group_name   = aws_db_subnet_group.aurora.name
  vpc_security_group_ids = [var.aurora_security_group_id]

  storage_encrypted = true

  backup_retention_period = 1

  serverlessv2_scaling_configuration {
    min_capacity = var.min_capacity
    max_capacity = var.max_capacity
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-aurora-cluster"
  })
}
