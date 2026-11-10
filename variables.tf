variable "instance_type" {
  default = "t2.micro"
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance in ap-south-1"
  type        = string
}
