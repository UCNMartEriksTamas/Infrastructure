resource "aws_vpc" "network" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.project_name
  }
}