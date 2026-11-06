terraform {
  backend "s3" {
    bucket       = "backend-store"
    key          = "vpc-project/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

