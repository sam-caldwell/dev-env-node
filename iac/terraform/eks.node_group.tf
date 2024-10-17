#
# resource "aws_eks_node_group" "this" {
#   cluster_name    = aws_eks_cluster.this.name
#   node_group_name = "eks-node-group"
#   node_role_arn   = aws_iam_role.eks_node_role.arn
#   subnet_ids      = aws_subnet.eks[*].id
#
#   scaling_config {
#     desired_size = 3
#     max_size     = 3
#     min_size     = 1
#   }
# }
