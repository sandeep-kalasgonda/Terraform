# main.tf

# Create S3 buckets in specified regions using the regions variable
resource "aws_s3_bucket" "multi_region_bucket" {
  for_each = toset(var.regions)

  bucket   = "${var.s3_bucket_names[count.index]}-${each.key}" # Modify bucket naming convention if needed
  provider = aws.$ { each.key }                                # Corrected syntax to use the provider for the current region

  acl = "private"
}

# Output bucket names
output "bucket_names" {
  value = [
    for bucket in aws_s3_bucket.multi_region_bucket : bucket.bucket
  ]
}
