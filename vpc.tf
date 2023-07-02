# Defines the VPC, subnets and IP addresses

resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "false"

    tags = {
        Name = "main VPC"
    }
  }

resource "aws_subnet" "recon_subnet" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
      Name = "recon subnet"
    }
}