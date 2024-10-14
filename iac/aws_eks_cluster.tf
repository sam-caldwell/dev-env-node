# iac/aws_eks_cluster.tf

resource "aws_eks_cluster" "this" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.eks_role.arn
  vpc_config {
    subnet_ids = aws_subnet.public[*].id
  }
}
