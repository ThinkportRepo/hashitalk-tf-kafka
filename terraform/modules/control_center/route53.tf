resource "aws_route53_record" "control-nodes" {
  count   = var.instance_count
  zone_id = var.route53_id
  name    = "control-center-${count.index}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.control_center.*.private_ip, count.index)]
}
