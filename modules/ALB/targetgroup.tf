# Create a target group for backend web servers
resource "aws_lb_target_group" "main" {
  name     = "vpc-cicd-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "instance"

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "vpc-cicd-target-group"
    Environment = "dev"
    Project     = "vpc-cicd"
  }
}
