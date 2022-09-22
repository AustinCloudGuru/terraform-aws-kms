#------------------------------------------------------------------------------
# Provider
#------------------------------------------------------------------------------
provider "aws" {
  region = var.region
}

terraform {
  required_version = "~> 1.2.0"

  required_providers {
    aws = "= 4.0"
  }
}

module "kms_key" {
  source                  = "../../"
  key_alias               = join("-", ["terratest", var.key_suffix])
  description             = "Terratest Automation Test Key"
  deletion_window_in_days = 7
  tags                    = var.tags
}
