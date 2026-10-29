variable "aws_region" {
  description = "AWS region where resources are created."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short project name used for naming and tagging."
  type        = string
  default     = "crm"
}
