
output "zookeeper_sg_id" {
  value       = aws_security_group.zookeeper.id
  description = "The name of the Auto Scaling Group"
}

