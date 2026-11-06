resource "aws_s3_bucket" "bucket" {
  bucket = "mujahid-demo-bucket-2026"

  tags = {
    Environment = "Dev"
  }
}
