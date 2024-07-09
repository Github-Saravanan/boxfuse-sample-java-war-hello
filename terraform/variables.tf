variable azure_subscription_id {
  description = "Value for Azure Subscription"
}

variable azure_client_id {
 description = "Value for Azure Client ID"
}

variable azure_client_secret {
    description ="Value for Azure CLient Secret"
}

variable azure_tenant_id {
    description ="Value for Azure Client ID"
}

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

variable "instance_type" {
  description = "Instance type for Elastic Beanstalk"
  type        = string
}

variable "resource_group" {
  description = "Resource Group Name"
  type        = string
}

variable "azure_region" {
  description = "Resource Group Location"
  type        = string
}

variable "app_service_plan" {
  description = "App Service Plan"
  type        = string
}

variable "sku_tier" {
  description = "SKU TIER"
  type        = string
}

variable "sku_size" {
  description = "SKU SIZE"
  type        = string
}

variable "app_service" {
  description = "App Service"
  type        = string
}