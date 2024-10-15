# iac/ecr.eks_permissions.tf
# resource "aws_iam_policy" "eks_permissions" {
#   name        = "EKS_ECR_Access"
#   description = "Policy to allow EKS cluster to push and pull images from ECR."
#
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "ecr:BatchCheckLayerAvailability",
#           "ecr:BatchGetImage",
#           "ecr:GetAuthorizationToken",
#           "ecr:PutImage",
#           "ecr:InitiateLayerUpload",
#           "ecr:UploadLayerPart",
#           "ecr:CompleteLayerUpload",
#           "ecr:DescribeRepositories",
#           "ecr:ListImages"
#         ]
#         Resource = "*"
#       }
#     ]
#   })
# }
#
# resource "aws_iam_role_policy_attachment" "attach_eks_ecr_policy" {
#   policy_arn = aws_iam_policy.eks_permissions.arn
#   role       = aws_iam_role.eks_role.name  # Replace with your actual EKS role
# }
