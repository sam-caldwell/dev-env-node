# iac/ecr/aws_ecr_repository.tf

resource "aws_ecr_repository" "this" {
  name                 = "repo"
  image_tag_mutability = "MUTABLE"

  lifecycle {
    prevent_destroy = false
  }
}
