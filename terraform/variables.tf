data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "eb-creds"
}

locals {
  db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

variable "aws_region" {
  description = "Value for AWS Region"
  default     = local.secrets["aws_region"]
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = local.secrets["vpc_cidr"]
}

variable "subnet_1_cidr" {
  description = "CIDR block for the first Subnet"
  type        = string
  default     = local.secrets["subnet_1_cidr"]
}

variable "subnet_2_cidr" {
  description = "CIDR block for the second Subnet"
  type        = string
  default     = local.secrets["subnet_2_cidr"]
}

variable "instance_type" {
  description = "Instance type for Elastic Beanstalk"
  type        = string
  default     = local.secrets["instance_type"]
}


variable "availability_zone_1" {
  description = "Availability Zone for the first Subnet"
  type        = string
  default     = local.secrets["availability_zone_1"]
}

variable "availability_zone_2" {
  description = "Availability Zone for the second Subnet"
  type        = string
  default     = local.secrets["availability_zone_2"]
}

variable "language" {
  description = "Solution stack name language for Elastic Beanstalk"
  type        = string
  default     = local.secrets["language"]
}

variable "instance_type" {
  description = "Instance type for Elastic Beanstalk"
  type        = string 
  default     = local.secrets["instance_type"]
}
