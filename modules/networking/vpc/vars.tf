variable "region" {
  type = string
}

variable "vpc_az" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
  default = "10.213.0.0/16"
}

variable "private_sub" {
  type = list(string)
}

variable "public_sub" {
  type = list(string)
}

variable "tenant" {
  description = "tenant name of the account"
}