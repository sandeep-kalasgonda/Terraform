resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id[0]]

  tags = {
    Name = var.tag_ec2_instance_name
    Env = var.tag_env
    Project = var.tag_project
  }
}