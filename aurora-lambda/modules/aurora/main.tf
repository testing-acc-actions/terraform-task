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

resource "aws_rds_cluster_instance" "aurora" {
  identifier         = "${var.project_name}-aurora-instance"
  cluster_identifier = aws_rds_cluster.aurora.id

  instance_class = "db.serverless"
  engine         = aws_rds_cluster.aurora.engine
  engine_version = aws_rds_cluster.aurora.engine_version

  publicly_accessible = false

  auto_minor_version_upgrade = true
  copy_tags_to_snapshot      = true

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-aurora-instance"
  })
}
