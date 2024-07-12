# Define data sources to retrieve parameters from Parameter Store
data "aws_ssm_parameter" "aws_region" {
  name = "/myapp/aws_region"
}

data "aws_ssm_parameter" "availability_zone_1" {
  name = "availability_zone_1"
}

data "aws_ssm_parameter" "availability_zone_2" {
  name = "availability_zone_2"
}

data "aws_ssm_parameter" "vpc_cidr" {
  name = "vpc_cidr"
}

data "aws_ssm_parameter" "subnet_1_cidr" {
  name = "subnet_1_cidr"
}

data "aws_ssm_parameter" "subnet_2_cidr" {
  name = "subnet_2_cidr"
}

data "aws_ssm_parameter" "language" {
  name = "language"
}

data "aws_ssm_parameter" "instance_type" {
  name = "instance_type"
}

data "aws_ssm_parameter" "application_name" {
  name = "application_name"
}

data "aws_ssm_parameter" "environment_name" {
  name = "environment_name"
}
