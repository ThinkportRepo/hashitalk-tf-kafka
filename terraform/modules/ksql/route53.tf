resource "aws_route53_record" "ksql-nodes" {
  count   = var.instance_count
  zone_id = var.route53_id
  name    = "ksql-${count.index}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.ksql.*.private_ip, count.index)]
}