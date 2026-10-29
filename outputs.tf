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
