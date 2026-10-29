# crm-infra-terraform

AWS infrastructure as code for the CRM project (region `us-east-1`).

## What this manages

- `aws_security_group.dev_target`: SSH (port 22) allowed only from one CIDR
- `aws_key_pair.target`: public key for the dev target
- `aws_instance.target`: t3.micro Ubuntu 24.04 dev target (Ansible/CD target)

The original hand-made dev server is NOT managed here.

## State

Remote state in S3 (`crm/dev/terraform.tfstate`) with encryption and versioning.
Locking uses the S3 lockfile (`use_lockfile = true`), no DynamoDB.
State is never committed to git.

## Local inputs (not committed)

Create `terraform.tfvars` (gitignored) with:

```hcl
ssh_cidr       = "<CIDR, e.g. 10.0.0.5/32>"
ssh_public_key = "ssh-ed25519 <public key> <comment>"
```

Never put secrets, access keys or private keys in this repo.

## Workflow

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -out=tfplan   # review the plan first
terraform apply tfplan
```

Rules: always read the plan before apply, keep PRs small, merge only when the
`terraform` CI check is green. Auth is via the server's IAM role (no access keys).

## Cost

The dev target costs money while running (instance + public IPv4).
Stop it when not in use, or run `terraform destroy` to remove it.
