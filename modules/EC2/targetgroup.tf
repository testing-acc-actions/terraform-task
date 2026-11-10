resource "aws_lb_target_group_attachment" "ec2" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.webserver.id
  port             = 80
}
