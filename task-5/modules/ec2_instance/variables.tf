variable "ami" {
  description = "AMI id to use"
}

variable "instance_type" {
  description = "Instance type to use"
}

variable "subnet_id" {
  description = "Subnet id to use"
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance"
}

#Tags
variable "tag_ec2_instance_name" {
  description = "EC2 instance name to use in tag"
}

variable "tag_env" {
  description = "Environment name to use in tag"
}

variable "tag_project" {
  description = "Project name to use in tag"
}