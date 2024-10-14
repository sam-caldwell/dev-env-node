# iac/acm/provider.tf

provider "aws" {
  region  = "us-east-1"
  profile = "localstack"
}
