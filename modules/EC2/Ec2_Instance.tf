variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
variable "alb_security_group_id" {
  description = "Security group ID of the ALB"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}


variable "subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

resource "aws_instance" "webserver" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name        = "Terraform-Webserver"
    Environment = "dev"
  }
}
