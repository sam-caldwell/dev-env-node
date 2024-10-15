# iac/vpc_subnet_app.tf

resource "aws_subnet" "app" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_app_cidr
  availability_zone       = var.vpc_az
  map_public_ip_on_launch = false
}
