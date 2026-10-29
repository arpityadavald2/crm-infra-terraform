# Read-only check: proves Terraform can reach AWS with the server's IAM role.
data "aws_caller_identity" "current" {}
