# Create an Application Load Balancer
resource "aws_lb" "main" {
  name               = "vpc-cicd-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "vpc-cicd-alb"
    Environment = "dev"
    Project     = "vpc-cicd"
  }
}
