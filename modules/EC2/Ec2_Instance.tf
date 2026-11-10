

# Create an EC2 instance for the application
resource "aws_instance" "webserver" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name        = "vpc-cicd-webserver"
    Environment = "dev"
    Project     = "vpc-cicd"
  }
}
