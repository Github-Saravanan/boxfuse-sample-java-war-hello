# Define data sources to retrieve parameters from Parameter Store
data "aws_ssm_parameter" "aws_region" {
  name = "/myapp/aws_region"
}

data "aws_ssm_parameter" "availability_zone_1" {
  name = "/myapp/availability_zone_1"
}

data "aws_ssm_parameter" "availability_zone_2" {
  name = "/myapp/availability_zone_2"
}

data "aws_ssm_parameter" "vpc_cidr" {
  name = "/myapp/vpc_cidr"
}

data "aws_ssm_parameter" "subnet_1_cidr" {
  name = "/myapp/subnet_1_cidr"
}

data "aws_ssm_parameter" "subnet_2_cidr" {
  name = "/myapp/subnet_2_cidr"
}

data "aws_ssm_parameter" "language" {
  name = "/myapp/language"
}

data "aws_ssm_parameter" "instance_type" {
  name = "/myapp/instance_type"
}

data "aws_ssm_parameter" "application_name" {
  name = "/myapp/application_name"
}

data "aws_ssm_parameter" "environment_name" {
  name = "/myapp/environment_name"
}
