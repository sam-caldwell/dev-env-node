# iac/eks_subnet.tf

resource "aws_subnet" "eks_subnet" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
}
