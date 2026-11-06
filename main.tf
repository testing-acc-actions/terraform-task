terraform {
  required_version = ">=1.10.0"
    required_providers{
      aws ={
      source = "hashicrop/aws"
      version = "~>6.72"
    }
  }
}
