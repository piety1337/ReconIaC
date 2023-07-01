# Defines the instance(s) configuration

resource "aws_instance" "recon" {           # Resource block that defines the components of the infrastructure. The resource type is an EC2 instance (defined by "aws_instance"), and the name of the instance is "recon" (the name is not recognised by AWS - just Terraform).
    ami = var.ami                           # Configures AMI to that defined in variables.tf.
    instance_type = var.instance_spec       # Defines specification of that defined in variables.tf.

    tags = {                                # Creates a tag(s).
      Name = "Reconnassiance machine"       
    }
}