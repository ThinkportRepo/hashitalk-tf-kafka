resource "aws_route53_record" "kafka-nodes" {
  count   = var.instance_count
  zone_id = var.route53_id
  name    = "kafka-broker-${count.index}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.kafka.*.private_ip, count.index)]
}