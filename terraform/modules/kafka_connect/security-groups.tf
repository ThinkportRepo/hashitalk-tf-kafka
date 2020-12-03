######################
# Security Groups
######################

resource "aws_security_group" "kafka_connect" {
  name        = "${var.component_name}-${var.region}-sg-${var.environment}-${var.instancename}-ec2"
  description = "Allow kafka_connect ${var.component_name} traffic"
  vpc_id      = var.vpc_id
  tags = merge(
  var.tags,
  {
   // Name = "${var.component_name}-kafka_connect-security-group"
    Name        = "${var.component_name}-${var.region}-sg-${var.environment}-${var.instancename}-ec2"
  },
  )
}

resource "aws_security_group_rule" "allow_kafka_connect" {
  type      = "ingress"
  from_port = 8082
  to_port   = 8083
  protocol  = "tcp"
  self      = true
  #cidr_blocks = ["${data.aws_subnet.MAIN_SUBNET.cidr_block}"]
  security_group_id = aws_security_group.kafka_connect.id
}



resource "aws_security_group_rule" "allow_node_exporter_port" {
  type      = "ingress"
  from_port = var.node_exporter
  to_port   = var.node_exporter
  protocol  = "tcp"
  self      = true

  security_group_id = aws_security_group.kafka_connect.id
}

resource "aws_security_group_rule" "allow_ping_from_jump_host_ip_self_bastion_egress" {
  type      = "egress"
  from_port = "0"
  to_port   = "0"
  protocol  = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  #cidr_blocks = ["${data.aws_subnet.MAIN_SUBNET.cidr_block}"]

  security_group_id = aws_security_group.kafka_connect.id
}

// FIXME: JJ: Loadbalancers need access to kafka connect
// Access from LB to port 9000 for service discovery
resource "aws_security_group_rule" "allow_kafkaconnect_port_LB" {
  security_group_id = aws_security_group.kafka_connect.id
  description = "Access from LB to port 8082 for  kafka connect"
  type              = "ingress"

  from_port       = 8082
  to_port         = 8082
  protocol        = "TCP"
  //cidr_blocks = "${flatten([data.aws_network_interface.ifs.*.private_ips])}"
  //cidr_blocks = "${formatlist("%s/32", "${flatten([data.aws_network_interface.ifs.*.private_ips])}")}"
  cidr_blocks = "${formatlist("%s/32", "${flatten([var.lb_interface_ids.*.private_ips])}")}"
}

resource "aws_security_group_rule" "ssh" {
  type      = "ingress"
  from_port = "22"
  to_port   = "22"
  protocol  = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.kafka_connect.id
}