resource "aws_kms_key" "kafka_zookeeper_kms" {
  description             = "KMS-${var.environment}-zookeeper"
  deletion_window_in_days = 30
}

