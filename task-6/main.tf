# https://registry.terraform.io/modules/claranet/vpc-modules/aws/latest/submodules/public-subnets?tab=outputs
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
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  subnet_id              = module.public_subnets.subnet_ids.0

  # nginx installation
  # user_data = file("userdata.tpl")

  tags = {
    Name   = "dev_instance"
    Environment = "dev"
  }
}

resource "aws_security_group" "ssh-allowed" {
    vpc_id = module.vpc.vpc_id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach the NGINX  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ssh-allowed"
        Environment = "dev"
    }
}