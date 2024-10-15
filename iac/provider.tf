# iac/acm/provider.tf

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}
