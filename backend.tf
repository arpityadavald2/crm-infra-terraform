terraform {
  backend "s3" {
    bucket       = "crm-tfstate-file-oct-2026"
    key          = "crm/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
