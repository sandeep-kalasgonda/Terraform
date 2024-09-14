## This script creates an EC2 instance and use the concepts of Terraform variables and output.
## Once the EC2 instance is created, the script will print the public ip of the instance.

variable "region" {
  description = "The AWS region where resources will be deployed."
  type        = string
  default     = "us-east-1"
}


provider "aws" {
    region = var.region
}


resource "aws_instance" "instance_tf" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
}


output "instance_public_ip" {
  value = aws_instance.instance_tf.public_ip
}