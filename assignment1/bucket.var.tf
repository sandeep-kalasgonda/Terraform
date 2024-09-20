variable "s3_bucket_names" {
  type        = list(string)
  description = "List of S3 bucket names"
  default     = ["my-bucket-1", "my-bucket-2", "my-bucket-3"] # Change as needed
}
