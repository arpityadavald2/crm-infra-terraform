data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "dev_target" {
  name        = "${var.project_name}-dev-target-sg"
  description = "SSH access for the CRM dev target"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-dev-target-sg"
  }
}
