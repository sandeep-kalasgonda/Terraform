variable "region" {
  description = "The AWS region where resources will be deployed."
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "A map of AMI IDs for different environments."
  type        = map(string)

  default = {
    dev  = "ami-0230bd60aa48260c6"
    prod = "ami-0fc5d935ebf8bc3bc"
  }
}
