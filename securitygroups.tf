resource "aws_security_group" "recon_sg" {
 name = "recon_sg"

 ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.whitelisted_cidr]
 }

 egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_security_group" "proxy_sg" {
 name = "proxy_sg"

 ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.whitelisted_cidr]
 }

ingress {
    from_port = 0
    to_port = 0
    protocol = ["-1"]
    cidr_blocks = [var.whitelisted_cidr]
}

 egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
}