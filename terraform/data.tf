data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "eb-creds"
}

locals {
  eb_creds      = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
  vpc_cidr      = local.eb_creds.vpc_cidr
}
