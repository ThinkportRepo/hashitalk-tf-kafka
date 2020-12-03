
output "cc_sg_id" {
  value       = aws_security_group.control_center.id
  description = "The name of the Auto Scaling Group"
}

