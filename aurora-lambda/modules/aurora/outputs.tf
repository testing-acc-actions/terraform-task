output "aurora_endpoint" {
  description = "Writer endpoint of the Aurora cluster"
  value       = aws_rds_cluster.aurora.endpoint
}

output "aurora_reader_endpoint" {
  description = "Reader endpoint of the Aurora cluster"
  value       = aws_rds_cluster.aurora.reader_endpoint
}

output "aurora_port" {
  description = "PostgreSQL database port"
  value       = aws_rds_cluster.aurora.port
}

output "aurora_cluster_identifier" {
  description = "Identifier of the Aurora cluster"
  value       = aws_rds_cluster.aurora.id
}

output "master_user_secret_arn" {
  description = "ARN of the Secrets Manager secret containing master credentials"
  value       = aws_rds_cluster.aurora.master_user_secret[0].secret_arn
}
