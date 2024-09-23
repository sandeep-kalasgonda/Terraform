output "ec2_instance_id" {
  value = module.ec2_instance.output_ec2_instance_id
}

output "security_group_id" {
  value = module.security_group.output_security_group_id
}