output "account_id" {
  description = "AWS account ID Terraform is running against."
  value       = data.aws_caller_identity.current.account_id
  sensitive   = true
}

output "caller_arn" {
  description = "ARN of the identity Terraform is using."
  value       = data.aws_caller_identity.current.arn
  sensitive   = true
}

output "security_group_id" {
  description = "ID of the dev target security group."
  value       = aws_security_group.dev_target.id
}

output "target_instance_id" {
  description = "ID of the dev target instance."
  value       = aws_instance.target.id
}

output "target_private_ip" {
  description = "Private IP of the dev target (use this for Ansible from the dev server)."
  value       = aws_instance.target.private_ip
}
