# iac/secrets_manager.grafana_admin.tf

resource "aws_secretsmanager_secret" "grafana_admin" {
  name        = local.grafana_name
  description = "Grafana admin user"

  tags = {
    Environment = "localstack"
    Application = local.grafana_name
  }
}

resource "aws_secretsmanager_secret_version" "grafana_admin" {
  secret_id     = aws_secretsmanager_secret.grafana_admin.id
  secret_string = random_password.grafana_admin.result
}

resource "random_password" "grafana_admin" {
  length  = 16
  special = true
  upper = true
  lower = true
  numeric = true
}