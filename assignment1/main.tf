# main.tf

# Create S3 buckets in us-east-1
resource "aws_s3_bucket" "us_east_bucket" {
  count  = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]

  provider = aws.us-east-1

  acl = "private"
}

# Create S3 buckets in ap-south-1
resource "aws_s3_bucket" "ap_south_bucket" {
  count  = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]

  provider = aws.ap-south-1

  acl = "private"
}

# Create S3 buckets in eu-west-1
resource "aws_s3_bucket" "eu_west_bucket" {
  count  = length(var.s3_bucket_names)
  bucket = var.s3_bucket_names[count.index]

  provider = aws.eu-west-1

  acl = "private"
}

# Output bucket names
output "bucket_names" {
  value = [
    aws_s3_bucket.us_east_bucket[*].bucket,
    aws_s3_bucket.ap_south_bucket[*].bucket,
    aws_s3_bucket.eu_west_bucket[*].bucket
  ]
}
