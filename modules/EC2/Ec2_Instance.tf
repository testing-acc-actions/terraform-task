resource "aws_instance" "webserver" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name        = "Terraform-Webserver"
    Environment = "dev"
  }
}
