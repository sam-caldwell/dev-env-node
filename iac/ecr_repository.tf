# iac/ecr/ecr_repository.tf

resource "aws_ecr_repository" "this" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"

  lifecycle {
    prevent_destroy = false
  }
}
