resource "aws_route53_record" "kafka_connect-nodes" {
  count   = var.instance_count
  zone_id = var.route53_id
  name    = "kafka_connect-${count.index}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.kafka_connect.*.private_ip, count.index)]
}