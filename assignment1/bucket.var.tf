# bucket_var.tf

variable "s3_bucket_names" {
  description = "Provide the list of buckets to be created"
  type        = list(string)
  default     = ["phoenix-proj-5534", "phoenix-proj-5634", "phoenix-proj-5734"]
}
