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
    map_public_ip_on_launch = "false"

    tags = {
      Name = "recon subnet"
    }
}

resource "aws_subnet" "proxy_subnet" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"

    tags = {
      Name = "proxy subnet"
    }
}

resource "aws_internet_gateway" "proxy_internet_gateway" {
    vpc_id = aws_vpc.main_vpc.id

    tags = {
      Nmae = "internet gateway for proxies"
    }
}

resource "aws_network_interface" "private_ip_recon" {
    subnet_id = aws_subnet.recon_subnet.id
    private_ips = ["10.0.0.1"]

    attachment {
      instance = aws_instance.recon.id
      device_index = 1
    }
  tags = {
    Name = "recon private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_1" {
    subnet_id = aws_subnet.proxy_subnet.id
    private_ips = ["10.0.1.1"]

    attachment {
      instance = aws_instance.proxy_1.id
      device_index = 1
    }
  tags = {
    Name = "proxy 1 private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_2" {
    subnet_id = aws_subnet.proxy_subnet.id
    private_ips = ["10.0.1.2"]

    attachment {
      instance = aws_instance.proxy_2.id
      device_index = 1
    }
  tags = {
    Name = "proxy 2 private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_3" {
    subnet_id = aws_subnet.proxy_subnet.id
    private_ips = ["10.0.1.3"]

    attachment {
      instance = aws_instance.proxy_3.id
      device_index = 1
    }
  tags = {
    Name = "proxy 3 private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_4" {
    subnet_id = aws_subnet.proxy_subnet.id
    private_ips = ["10.0.1.4"]

    attachment {
      instance = aws_instance.proxy_4.id
      device_index = 1
    }
  tags = {
    Name = "proxy 4 private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_5" {
    subnet_id = aws_subnet.proxy_subnet.id
    private_ips = ["10.0.1.5"]

    attachment {
      instance = aws_instance.proxy_5.id
      device_index = 1
    }
  tags = {
    Name = "proxy 5 private ip address"
  }
}