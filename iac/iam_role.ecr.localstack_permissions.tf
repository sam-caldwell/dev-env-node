# iac/iam_role.ecr.localstack_permissions.tf

resource "aws_iam_policy" "localstack_permissions" {
  name        = "ECRPushPolicy"
  description = "Policy to allow pushing images to ECR"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:GetAuthorizationToken",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:DescribeRepositories",
          "ecr:ListImages"
        ]
        Resource = aws_ecr_repository.this.repository_url
      },
      {
        Effect = "Allow"
        Action = "ecr:GetAuthorizationToken"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "test_user_ecr_policy" {
  user       = "test"
  policy_arn = aws_iam_policy.localstack_permissions.arn
}
