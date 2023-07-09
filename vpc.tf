# Defines the VPC, subnets and IP addresses

resource "aws_vpc" "main_vpc" {        # Defines the VPC configuration, where subnets will reside.
  cidr_block           = "10.0.0.0/16" # Defines number of hosts that can fit in the network.
  instance_tenancy     = "default"     # Ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched.
  enable_dns_support   = "true"
  enable_dns_hostnames = "false"

  tags = {
    Name = "main VPC"
  }
}

resource "aws_subnet" "recon_subnet" { # Defines the subnet which the recon machine will reside in.
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" # Specifies that the instances launched into this subnet should be assigned a public IP address.

  tags = {
    Name = "recon subnet"
  }
}

resource "aws_subnet" "proxy_subnet" { # Defines the subnet which the proxy machines will reside in.
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true" # Specifies that the instances launched into this subnet should be assigned a public IP address.

  tags = {
    Name = "proxy subnet"
  }
}

resource "aws_internet_gateway" "internet_gateway" { # Defines the Internet gateway, which allows internet traffic to and from the VPC. This sits outside the subnets.
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "internet gateway"
  }
}

resource "aws_route_table" "public_route_table" { # Defines which external IPs are accessable from the Internet gateway.
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0" # Specifies that all IPs are accessable.
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_route_table_association" "public_route_table_association_1" { # Creates an association between a route table and a proxy subnet.
  subnet_id      = aws_subnet.proxy_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_association_2" { # Creates an association between a route table and a recon subnet.
  subnet_id      = aws_subnet.recon_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_network_interface" "private_ip_recon" { # Recon machine
  subnet_id   = aws_subnet.recon_subnet.id
  private_ips = ["10.0.1.100"]

  attachment {
    instance     = aws_instance.recon.id
    device_index = 1
  }
  tags = {
    Name = "recon private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_1" { # Proxy 1
  subnet_id   = aws_subnet.proxy_subnet.id
  private_ips = ["10.0.2.101"]

  attachment {
    instance     = aws_instance.proxy_1.id
    device_index = 1
  }
  tags = {
    Name = "proxy 1 private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_2" { # Proxy 2
  subnet_id   = aws_subnet.proxy_subnet.id
  private_ips = ["10.0.2.102"]

  attachment {
    instance     = aws_instance.proxy_2.id
    device_index = 1
  }
  tags = {
    Name = "proxy 2 private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_3" { # Proxy 3
  subnet_id   = aws_subnet.proxy_subnet.id
  private_ips = ["10.0.2.103"]

  attachment {
    instance     = aws_instance.proxy_3.id
    device_index = 1
  }
  tags = {
    Name = "proxy 3 private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_4" { # Proxy 4
  subnet_id   = aws_subnet.proxy_subnet.id
  private_ips = ["10.0.2.104"]

  attachment {
    instance     = aws_instance.proxy_4.id
    device_index = 1
  }
  tags = {
    Name = "proxy 4 private ip address"
  }
}

resource "aws_network_interface" "private_ip_proxy_5" { # Proxy 5
  subnet_id   = aws_subnet.proxy_subnet.id
  private_ips = ["10.0.2.105"]

  attachment {
    instance     = aws_instance.proxy_5.id
    device_index = 1
  }
  tags = {
    Name = "proxy 5 private ip address"
  }
}