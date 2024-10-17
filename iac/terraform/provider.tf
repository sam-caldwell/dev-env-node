# iac/acm/provider.tf

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

provider "kubernetes" {
  config_path = "~/.kube/config" # local_file.kubeconfig.filename
}
