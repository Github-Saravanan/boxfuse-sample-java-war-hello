data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "eb-creds"
}

locals {
  eb_creds      = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
  vpc_cidr      = local.eb_creds.vpc_cidr
  subnet_1_cidr = local.eb_creds.subnet_1_cidr
  subnet_2_cidr = local.eb_creds.subnet_2_cidr
  instance_type = local.eb_creds.instance_type
  language      = local.eb_creds.language
}
