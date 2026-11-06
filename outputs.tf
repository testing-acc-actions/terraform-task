output "vpc_id" {
  description = "ID of the learning VPC"
  value       = aws_vpc.main.id
}
