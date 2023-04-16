terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
      region =  var.region
    }
  }
}


terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "pt-${var.tenant}-vpc"
  cidr = var.vpc_cidr

  azs             = var.vpc_az
  private_subnets = var.private_sub
  public_subnets  = var.public_sub

  enable_nat_gateway = true
  enable_vpn_gateway = false
  enable_ipv6        = true
  public_subnet_assign_ipv6_address_on_creation = true

  tags = {
    Terraform = "true"
    Environment = var.tenant
  }
}