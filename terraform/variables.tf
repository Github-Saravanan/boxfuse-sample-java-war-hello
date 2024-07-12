data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "eb-creds"
}

locals {
  eb_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
  vpc_cidr      = local.eb_creds.vpc_cidr
  subnet_1_cidr = local.eb_creds.subnet_1_cidr
  subnet_2_cidr = local.eb_creds.subnet_2_cidr
  instance_type = local.eb_creds.instance_type
  language      = local.eb_creds.language
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = local.vpc_cidr
}

variable "subnet_1_cidr" {
  description = "CIDR block for the first Subnet"
  type        = string
  default     = local.subnet_1_cidr
}

variable "subnet_2_cidr" {
  description = "CIDR block for the second Subnet"
  type        = string
  default     = local.subnet_2_cidr
}

variable "instance_type" {
  description = "Instance type for Elastic Beanstalk"
  type        = string
  default     = local.instance_type
}

variable "language" {
  description = "Solution stack name language for Elastic Beanstalk"
  type        = string
  default     = local.language
}
