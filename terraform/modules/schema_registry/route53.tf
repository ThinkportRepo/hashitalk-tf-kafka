resource "aws_route53_record" "schema_registry-nodes" {
  count   = var.instance_count
  zone_id = var.route53_id
  name    = "schema_registry-nodes-${count.index}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.schema_registry.*.private_ip, count.index)]
}