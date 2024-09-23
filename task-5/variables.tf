variable "ami" {
  default = ""
}

variable "instance_type" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

#Tags
variable "tag_ec2_instance_name" {
  default = ""
}

variable "tag_security_group_name" {
  default = ""
}

variable "tag_env" {
  default = ""
}

variable "tag_project" {
  default = ""
}