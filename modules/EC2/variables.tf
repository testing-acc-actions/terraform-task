variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet where the EC2 instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "Security groups attached to the EC2 instance"
  type        = list(string)
}
