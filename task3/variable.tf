variable "region" {
  default = "us-east-1"
}

variable "vpc-name" {
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
variable "tag-env" {
  default = "dev"
}

variable "tag-project" {
  default = "smart-store"
}