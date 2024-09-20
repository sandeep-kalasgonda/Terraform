## This script creates an EC2 instance and use the concepts of Terraform variables and output.
## Once the EC2 instance is created, the script will print the public ip of the instance.
provider "aws" {
  region = var.region
}

# Create EC2 instance based on the workspace environment.
resource "aws_instance" "dev_instance" {
  ami           = var.ami[terraform.workspace]
  instance_type = "t2.micro"

  tags = {
    Name = "dev-1"
  }
}

output "instance_public_ip" {
  value = aws_instance.dev_instance.public_ip
}

# Terraform state file
terraform {
  backend "s3" {
    bucket = "dev567-tf-state123456"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}