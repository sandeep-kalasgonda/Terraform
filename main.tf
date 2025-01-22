# Specify the AWS provider and region
provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

# Resource block to create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI ID (replace with your region's AMI)
  instance_type = "t2.micro"              # Instance type

  # Tags for the instance
  tags = {
    Name = "MyTerraformEC2Instance"
  }
}
