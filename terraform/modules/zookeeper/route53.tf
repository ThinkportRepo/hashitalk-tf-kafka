resource "aws_route53_record" "zookeeper" {
  count   = var.instance_count
  zone_id = var.route53_id
  name    = "zookeeper-nodes-${count.index}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.zookeeper.*.private_ip, count.index)]
}
