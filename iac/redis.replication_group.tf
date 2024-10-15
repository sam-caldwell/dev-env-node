# iac/redis.replication_group.tf

resource "aws_elasticache_replication_group" "this" {
  replication_group_id          = "localstack-redis-cluster"
  node_type                     = "cache.t3.micro"
  engine                        = "redis"
  engine_version                = "6.x"
  parameter_group_name          = "default.redis6.x"
  port                          = var.redis_port
  subnet_group_name             = aws_elasticache_subnet_group.this.name
  security_group_ids            = [
    aws_security_group.redis_sg.id
  ]

  automatic_failover_enabled     = true
  description                    = "Redis cluster for local development"
}
