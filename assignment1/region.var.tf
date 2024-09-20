provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "ap-south-1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "eu-west-1"
  region = "eu-west-1"
}

variable "regions" {
  description = "List of AWS regions where resources will be created."
  type        = list(string)
  default     = ["us-east-1", "ap-south-1", "eu-west-1"]
}
