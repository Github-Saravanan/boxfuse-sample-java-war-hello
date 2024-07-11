data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "eb-creds-tf"
}

locals {
  eb_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}

locals {
  aws_region           = local.eb_creds["aws_region"]
  vpc_cidr             = local.eb_creds["vpc_cidr"]
  subnet_1_cidr        = local.eb_creds["subnet_1_cidr"]
  subnet_2_cidr        = local.eb_creds["subnet_2_cidr"]
  instance_type        = local.eb_creds["instance_type"]
  availability_zone_1  = local.eb_creds["availability_zone_1"]
  availability_zone_2  = local.eb_creds["availability_zone_2"]
  language             = local.eb_creds["language"]
  application_name     = local.eb_creds["application_name"]
  environment_name     = local.eb_creds["environment_name"]
}

variable "aws_region" {
  description = "Value for AWS Region"
  type        = string
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

variable "availability_zone_1" {
  description = "Availability Zone for the first Subnet"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone for the second Subnet"
  type        = string
}

variable "language" {
  description = "Solution stack name language for Elastic Beanstalk"
  type        = string
}
