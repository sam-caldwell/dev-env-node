# iac/redis.cluster.tf

resource "aws_elasticache_cluster" "this" {
  cluster_id           = "localstack-redis"
  engine               = "redis"
  num_cache_nodes      = 1  # Or use aws_elasticache_replication_group for clustering
  node_type            = "cache.t3.micro"
  parameter_group_name = "default.redis6.x"
  port                 = 6379
  engine_version       = "6.x"
  subnet_group_name    = aws_elasticache_subnet_group.this.name
  security_group_ids   = [aws_security_group.redis_sg.id]
}
