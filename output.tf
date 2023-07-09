# Prints information about the deployment, such as the public IP addresses are (although, this can be identified on the AWS console)

output "recon_ip" {
  value = aws_instance.recon.public_ip
}
output "proxy_1_ip" {
  value = aws_instance.proxy_1.public_ip
}

output "proxy_2_ip" {
  value = aws_instance.proxy_2.public_ip
}

output "proxy_3_ip" {
  value = aws_instance.proxy_3.public_ip
}

output "proxy_4_ip" {
  value = aws_instance.proxy_4.public_ip
}

output "proxy_5_ip" {
  value = aws_instance.proxy_5.public_ip
}

output "private_key" {
  value     = tls_private_key.ssh_priv_key.private_key_pem
  sensitive = true
}



