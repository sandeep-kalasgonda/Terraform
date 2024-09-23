module "ec2_instance" {
  source = "./modules/ec2_instance"

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group_id = [module.security_group.output_security_group_id]

  tag_ec2_instance_name = var.tag_ec2_instance_name
  tag_env = var.tag_env
  tag_project = var.tag_project
}

module "security_group" {
  source = "./modules/security_group"

  vpc_id = var.vpc_id

  tag_security_group_name =  var.tag_security_group_name
  tag_env = var.tag_env
  tag_project = var.tag_project
}