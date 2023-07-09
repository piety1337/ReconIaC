# Defines the instance(s) configuration

resource "aws_instance" "recon" {                       # Resource block that defines the components of the infrastructure. The resource type is an EC2 instance (defined by "aws_instance"), and the name of the instance is "recon" (the name is not recognised by AWS - just Terraform).
  ami                         = var.ami                 # Configures AMI to that defined in variables.tf.
  instance_type               = var.recon_instance_type # Defines specification of that defined in variables.tf.
  subnet_id                   = aws_subnet.recon_subnet.id
  vpc_security_group_ids      = [aws_security_group.recon_sg.id]
  key_name                    = aws_key_pair.recon_key_pair.key_name
  associate_public_ip_address = true

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = tls_private_key.ssh_priv_key.private_key_pem
    host = aws_instance.recon.public_ip
  }

  provisioner "remote-exec" {
    script = "./script.sh"
  }

  tags = { # Creates a tag(s).
    Name = "Reconnassiance machine"
  }
}

resource "aws_instance" "proxy_1" {
  ami                         = var.ami
  instance_type               = var.proxy_instance_type
  subnet_id                   = aws_subnet.proxy_subnet.id
  vpc_security_group_ids      = [aws_security_group.proxy_sg.id]
  key_name                    = aws_key_pair.recon_key_pair.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Proxy machine 1"
  }
}

resource "aws_instance" "proxy_2" {
  ami                         = var.ami
  instance_type               = var.proxy_instance_type
  subnet_id                   = aws_subnet.proxy_subnet.id
  vpc_security_group_ids      = [aws_security_group.proxy_sg.id]
  key_name                    = aws_key_pair.recon_key_pair.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Proxy machine 2"
  }
}

resource "aws_instance" "proxy_3" {
  ami                         = var.ami
  instance_type               = var.proxy_instance_type
  subnet_id                   = aws_subnet.proxy_subnet.id
  vpc_security_group_ids      = [aws_security_group.proxy_sg.id]
  key_name                    = aws_key_pair.recon_key_pair.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Proxy machine 3"
  }
}

resource "aws_instance" "proxy_4" {
  ami                         = var.ami
  instance_type               = var.proxy_instance_type
  subnet_id                   = aws_subnet.proxy_subnet.id
  vpc_security_group_ids      = [aws_security_group.proxy_sg.id]
  key_name                    = aws_key_pair.recon_key_pair.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Proxy machine 4"
  }
}

resource "aws_instance" "proxy_5" {
  ami                         = var.ami
  instance_type               = var.proxy_instance_type
  subnet_id                   = aws_subnet.proxy_subnet.id
  vpc_security_group_ids      = [aws_security_group.proxy_sg.id]
  key_name                    = aws_key_pair.recon_key_pair.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Proxy machine 5"
  }
}