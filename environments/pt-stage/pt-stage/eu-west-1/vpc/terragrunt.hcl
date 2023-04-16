terraform {
  source = "../../../../..//modules/networking/vpc"
}


include "root" {
  path = find_in_parent_folders()
}


inputs = {
  vpc_cidr = "172.20.0.0/16"
  vpc_az = ["eu-west-1a", "eu-west-1b"]
  private_sub = ["172.20.1.0/24", "172.20.2.0/24"]
  public_sub = ["172.20.3.0/24", "172.20.4.0/24"]

}