
# main.tf

module "vpc" {
  source  = "claranet/vpc-modules/aws//modules/vpc"
  version = "1.1.1"

  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
}

module "public_subnets" {
  source  = "claranet/vpc-modules/aws//modules/public-subnets"
  version = "1.1.1"

  vpc_id                  = module.vpc.vpc_id
  gateway_id              = module.vpc.internet_gateway_id
  map_public_ip_on_launch = true
  cidr_block              = var.public_subnet_cidr_block
  subnet_count            = 1
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name = var.ec2_instance_name

  instance_type          = var.instance_type
  key_name               = var.ec2_user
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
  subnet_id              = module.public_subnets.subnet_ids[0]

  # nginx installation
  user_data = file("userdata.tpl")

  tags = {
    Name        = "dev_instance"
    Environment = "dev"
  }
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name        = "ssh-allowed"
    Environment = "dev"
  }
}
