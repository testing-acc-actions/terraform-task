
variable "vpc_id" {
  description = "The ID of the VPC where the ALB security group will be created"
  type        = string
}
variable "subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}
