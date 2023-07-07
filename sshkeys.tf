resource "tls_private_key" "ssh_priv_key" { # Generates a secure private key and encodes it as PEM.
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "aws_key_pair" "recon_key_pair" { # Provides an EC2 key pair resource, used to control login access to the recon EC2 instance.
  key_name   = var.private_key
  public_key = tls_private_key.ssh_priv_key.public_key_openssh
  }

