provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "create-bucket" {
  count  = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]
}