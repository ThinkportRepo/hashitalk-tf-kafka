######################
# Security Groups
######################

resource "aws_security_group" "zookeeper" {
  name        = "${var.component_name}-${var.region}-sg-${var.environment}-${var.instancename}-ec2"
  description = "Allow Zookeeper traffic for ${var.component_name}"
  vpc_id      = var.vpc_id
  tags = merge(
  var.tags,
  {
    //Name = "${var.component_name}-zookeeper-security-group"
    Name        = "${var.component_name}-${var.region}-sg-${var.environment}-${var.instancename}-ec2"

  },
  )
}

resource "aws_security_group_rule" "allow_zookeeper_quorum" {
  type                     = "ingress"
  from_port                = var.zookeeper_client_port
  to_port                  = var.zookeeper_client_port
  protocol                 = "tcp"
  self                     = true
  #cidr_blocks = ["${aws_subnet.MAIN_VPC_ZOOKEEPER_SUBNET_2.cidr_block}"]
  security_group_id = aws_security_group.zookeeper.id
}

resource "aws_security_group_rule" "allow_zookeeper_internal_communication" {
  type      = "ingress"
  from_port = var.zookeeper_internal
  to_port   = var.zookeeper_internal
  protocol  = "tcp"
  self      = true
  #cidr_blocks = ["${aws_subnet.MAIN_VPC_ZOOKEEPER_SUBNET_3.cidr_block}"]
  security_group_id = aws_security_group.zookeeper.id
}

resource "aws_security_group_rule" "allow_zookeeper_leader_election" {
  type      = "ingress"
  from_port = var.zookeeper_election
  to_port   = var.zookeeper_election
  protocol  = "tcp"
  self      = true
  #cidr_blocks = ["${aws_subnet.MAIN_VPC_ZOOKEEPER_SUBNET_1.cidr_block}"]
  security_group_id = aws_security_group.zookeeper.id
}

resource "aws_security_group_rule" "allow_jmx_port" {
  type      = "ingress"
  from_port = var.jmx_port
  to_port   = var.jmx_port
  protocol  = "tcp"
  self      = true
  #cidr_blocks = ["${aws_subnet.MAIN_VPC_ZOOKEEPER_SUBNET_1.cidr_block}"]
  security_group_id = aws_security_group.zookeeper.id
}


resource "aws_security_group_rule" "allow_node_exporter_port" {
  type      = "ingress"
  from_port = var.node_exporter
  to_port   = var.node_exporter
  protocol  = "tcp"
  self      = true
  security_group_id = aws_security_group.zookeeper.id
}


resource "aws_security_group_rule" "allow_ping_from_jump_host_ip_self_bastion_egress" {
  type      = "egress"
  from_port = "0"
  to_port   = "0"
  protocol  = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  #cidr_blocks = ["${data.aws_subnet.MAIN_SUBNET.cidr_block}"]
  security_group_id = aws_security_group.zookeeper.id
}

resource "aws_security_group_rule" "ssh" {
  type      = "ingress"
  from_port = "22"
  to_port   = "22"
  protocol  = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.zookeeper.id
}