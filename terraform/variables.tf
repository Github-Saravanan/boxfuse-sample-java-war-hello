data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "eb-creds"
}

locals {
  eb_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
  vpc_cidr      = local.eb_creds.vpc_cidr
  subnet_1_cidr = local.eb_creds.subnet_1_cidr
  subnet_2_cidr = local.eb_creds.subnet_2_cidr
  instance_type = local.eb_creds.instance_type
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_1_cidr" {
  description = "CIDR block for the first Subnet"
  type        = string
}

variable "subnet_2_cidr" {
  description = "CIDR block for the second Subnet"
  type        = string
}

variable "instance_type" {
  description = "Instance type for Elastic Beanstalk"
  type        = string
}
