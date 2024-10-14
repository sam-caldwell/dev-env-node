# iac/redis.tf

resource "aws_elasticache_cluster" "this" {
  cluster_id           = "localstack-redis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 3
  parameter_group_name = "default.redis3.2"
  port                 = 6379
}
