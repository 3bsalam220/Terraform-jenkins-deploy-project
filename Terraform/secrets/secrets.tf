resource "aws_secretsmanager_secret" "sec" {
  name="secrets-of-app"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "appV1" {
  secret_id = aws_secretsmanager_secret.sec.id
  secret_string = jsonencode({
    DB_HOST     = "changeme"
    DB_USER     = "changeme"
    DB_PASSWORD = "changeme"
    API_KEY     = "changeme"
  })
    lifecycle {
    ignore_changes = [secret_string]
  }
}

