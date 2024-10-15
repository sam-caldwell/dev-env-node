# iac/vpc_subnet_eks.tf

resource "aws_subnet" "eks" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_eks_cidr
  availability_zone       = var.vpc_az
  map_public_ip_on_launch = false
}
