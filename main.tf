# main.tf defines the provider (cloud that Terraform uses to provision the defined infrastructure).

terraform { # Defines the Terraform block (Terraform settings).
  required_providers {
    aws = {                     # For Azure, use 'azurerm'; and for GCP, use 'google'. However, different providers may require different configuration formatting. For instance, GCP requires the specification of 'project' and 'zone' in the provider block.
      source  = "hashicorp/aws" # 'source' attribute defines the desired provider (e.g. AWS, Azure and GCP). 'hashicorp/aws' is shorthand for 'registry.terraform.io/hashicorp/aws'.
      version = "~> 5.6.2"      # 'version' attribute is optional; however, without it, Terraform will automatically download the latest version (of the provider) during initilisation.
    }
  }
}

provider "aws" {
  region     = "eu-west-2"            # Defines the region.
  access_key = "XXXXXXXXXXXXXXXX" # Access key and secret key are used to authenticate to your AWS account in order to create the infrastructure.
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}