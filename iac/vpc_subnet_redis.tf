# iac/vpc_subnet_redis.tf

resource "aws_elasticache_subnet_group" "this" {
  name       = "localstack-redis-subnet-group"
  description = "Subnet group for Redis"
  subnet_ids = [
    aws_subnet.redis1.id,  # Reference to your Redis subnet
    aws_subnet.redis2.id,    # Reference to your application subnet (optional)
    aws_subnet.redis3.id,    # Reference to your EKS subnet (optional)
  ]

  tags = {
    Name = "localstack-redis-subnet-group"
  }
}


resource "aws_subnet" "redis1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_redis_cidr1
  availability_zone       = var.vpc_az1
  map_public_ip_on_launch = false
}


resource "aws_subnet" "redis2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_redis_cidr2
  availability_zone       = var.vpc_az2
  map_public_ip_on_launch = false
}


resource "aws_subnet" "redis3" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_redis_cidr3
  availability_zone       = var.vpc_az3
  map_public_ip_on_launch = false
}


resource "aws_subnet" "redis" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_redis_cidr
  availability_zone       = var.vpc_az
  map_public_ip_on_launch = false
}
