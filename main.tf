terraform {
required_version = ">=1.10.0"
required_providers{
aws ={
source = "harshicrop/aws"
version = "~>1.6"
}
}

provider "aws"{
region="ap-south-1a"
}


