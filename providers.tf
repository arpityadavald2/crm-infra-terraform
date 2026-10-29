provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "crm"
      ManagedBy = "terraform"
    }
  }
}
