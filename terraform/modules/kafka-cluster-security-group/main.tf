resource "aws_security_group_rule" "allow_zookeeper_to_brokers" {

  security_group_id = data.aws_security_group.selected_zookeeper.id
  type              = "ingress"

  source_security_group_id = data.aws_security_group.selected_kafka.id

  from_port       = 2181
  to_port         = 2181
  protocol        = "TCP"
}