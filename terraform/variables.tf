variable aws_region {
    description ="Value for AWS Region"
}

variable aws_access_key {
    description ="Value for AWS Access Key"
}

variable aws_secret_key {
    description ="Value for AWS Secret Key"
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
