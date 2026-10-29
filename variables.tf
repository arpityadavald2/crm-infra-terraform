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

variable "ssh_cidr" {
  description = "CIDR allowed to SSH in, e.g. 203.0.113.10/32. Set in terraform.tfvars (gitignored)."
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_cidr, 0)) && var.ssh_cidr != "0.0.0.0/0"
    error_message = "ssh_cidr must be a valid CIDR and must not be 0.0.0.0/0."
  }
}
