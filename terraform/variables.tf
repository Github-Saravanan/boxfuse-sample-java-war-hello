data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "eb_creds"
}

locals {
  eb-creds-tf = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}

locals {

  vpc_cidr             = local.eb-creds-tf["vpc_cidr"]
  subnet_1_cidr        = local.eb-creds-tf["subnet_1_cidr"]
  subnet_2_cidr        = local.eb-creds-tf["subnet_2_cidr"]
  instance_type        = local.eb-creds-tf["instance_type"]
  language             = local.eb-creds-tf["language"]

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

variable "language" {
  description = "Solution stack name language for Elastic Beanstalk"
  type        = string
}

