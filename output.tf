# Prints information about the deployment, such as the public IP addresses are (although, this can be identified on the AWS console)

output "recon_ip" {
    value = aws_instance.recon.public_ip            # Outputs the public IP address of the recon machine.
  
}