
resource "aws_instance" "webserver" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
