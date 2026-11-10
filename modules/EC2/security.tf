resource "aws_security_group" "ec2" {
  name        = "vpc-cicd-ec2-sg"
  description = "Allow application traffic only from ALB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "vpc-cicd-ec2-sg"
    Environment = "dev"
    Project     = "vpc-cicd"
  }
}
