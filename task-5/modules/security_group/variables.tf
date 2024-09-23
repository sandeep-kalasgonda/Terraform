variable "vpc_id" {
  description = "Vpc id to use"
}

#Tags
variable "tag_security_group_name" {
  description = "Security group name to use in tag"
}

variable "tag_env" {
  description = "Environment name to use in tag"
}

variable "tag_project" {
  description = "Project name to use in tag"
}