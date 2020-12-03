######################
# Security Groups
######################

#########################
## Kafka

resource "aws_security_group" "kafka" {
  name        = "${var.component_name}-${var.region}-sg-${var.environment}-${var.instancename}-ec2"

  description = "Allow kafka ${var.component_name} traffic"
  vpc_id      = var.vpc_id
  tags = merge(
  var.tags,
  {
    Name        = "${var.component_name}-${var.region}-sg-${var.environment}-${var.instancename}-ec2"
  },
  )
}

resource "aws_security_group_rule" "allow_broker_intercommunication" {
  type      = "ingress"
  from_port = 9092
  to_port   = 9092
  protocol  = "tcp"
  self      = true
  security_group_id = aws_security_group.kafka.id
}


resource "aws_security_group_rule" "allow_kafka_ssl" {
  type      = "ingress"
  from_port = var.port_ssl
  to_port   = var.port_ssl
  protocol  = "tcp"
  self      = true
  #cidr_blocks = ["${data.aws_subnet.MAIN_SUBNET.cidr_block}"]

  security_group_id = aws_security_group.kafka.id
}

resource "aws_security_group_rule" "allow_jmx_port" {
  type      = "ingress"
  from_port = var.jmx_port
  to_port   = var.jmx_port
  protocol  = "tcp"
  self      = true
  #cidr_blocks = ["${data.aws_subnet.MAIN_SUBNET.cidr_block}"]

  security_group_id = aws_security_group.kafka.id
}

resource "aws_security_group_rule" "allow_node_exporter_port" {
  type      = "ingress"
  from_port = var.node_exporter
  to_port   = var.node_exporter
  protocol  = "tcp"
  self      = true
  security_group_id = aws_security_group.kafka.id
}


resource "aws_security_group_rule" "allow_ping_from_jump_host_ip_self_bastion_egress" {
  type      = "egress"
  from_port = "0"
  to_port   = "0"
  protocol  = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.kafka.id
}

resource "aws_security_group_rule" "ssh" {
  type      = "ingress"
  from_port = "22"
  to_port   = "22"
  protocol  = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.kafka.id
}

