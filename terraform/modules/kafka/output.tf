
output "kafka_sg_id" {
  value       = aws_security_group.kafka.id
  description = "The name of the Auto Scaling Group"
}

