# iac/acm/provider.tf

provider "aws" {
  region  = var.region
  profile = "localstack"
}
