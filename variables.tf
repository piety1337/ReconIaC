# variables.tf defines variables that are likely to change upon requirements and/or preference, that are used across the configuration files.

variable "ami" {            # Defines the AMI of an EC2. This define characteristics of an EC2 instance, such as region, OS, version and architecture.
    type = string           
    default = "ami-0ccdcf8ea5cace030"           # This AMI ID corresponds to: Ubuntu 22.04 LTS (Jammy Jellyfish), amd64, eu-west-2.
}

variable "instance_spec" {          # Defines the computational specifications and resources of the EC2 instance, such as CPU, memory, storage and network capacity.
    type = string
    default = "t2.micro"            # 't2.micro' has the following specifications: burstable performance 1vCPU (3.3 GHz Xeon), 1 GiB memory, 6 CPU credits/hr and "low to moderate" network performance. This should be enough for reconnaissance.
}

variable "whitelisted_cidr" {       # Defines the whitelisted IP address(es) permitted to access or interact (ingress) with a specified port on the EC2 instance. For instance, this could be the permitted IP address(es) to SSH into the recon machine.
    type = string
    default = "0.0.0.0/32"          # Change this value according to your requirements (the IP address from which you are accessing the recon machine from).
}

