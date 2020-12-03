
output "sr_sg_id" {
  value       = aws_security_group.schema_registry.id
  description = "The name of the Auto Scaling Group"
}

