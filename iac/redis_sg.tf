# iac/redis_sg.tf

resource "aws_security_group" "redis_sg" {
  name        = "redis-sg"
  description = "Security group for Redis"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = var.redis_port
    to_port     = var.redis_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = var.redis_port
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }
}