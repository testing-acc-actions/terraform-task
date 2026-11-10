# Create a security group for the Application Load Balancer
resource "aws_security_group" "alb" {
  name        = "vpc-cicd-alb-sg"
  description = "Allow HTTP traffic to the ALB"
  vpc_id      = var.vpc_id

  # Allow inbound HTTP traffic
  ingress {
    description = "Allow HTTP from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound traffic
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "vpc-cicd-alb-sg"
    Environment = "dev"
    Project     = "vpc-cicd"
  }
}
