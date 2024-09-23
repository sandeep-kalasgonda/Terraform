# Define the variable for SSH and HTTP ports
variable "ssh_port" {
  description = "The port number to allow SSH traffic"
  default     = 22
}

variable "http_port" {
  description = "The port number to allow HTTP traffic"
  default     = 80
}

# Define the variable for CIDR blocks
variable "cidr_blocks" {
  description = "CIDR block for allowed IP ranges"
  default     = ["0.0.0.0/0"]
}
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "ec2_instance_name" {
  default = "nginx-instance"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_user" {
  default = "eks"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc_name" {
  default = "dev-vpc"
}

variable "public-subnet-name" {
  default = "pub-sub-1"
}

variable "private-subnet-name" {
  default = "prv-sub-1"
}

variable "route-table-name" {
  default = "dev-rt-1"
}

variable "internet-gateway-name" {
  default = "dev-igw-1"
}

#Tags
variable "tag_env" {
  default = "dev"
}

variable "tag_project" {
  default = "smart-store"
}