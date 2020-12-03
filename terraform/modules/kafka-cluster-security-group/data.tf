data "aws_security_group" "selected_sg" {
  count = length(var.security_group_list)
  id    = element(var.security_group_list, count.index)
}


data "aws_security_group" "selected_kafka" {
  #name = "${var.component_name}-${var.region}-sg-${var.environment}-kafka-broker-ec2"
  id = var.kafka_sg_id
}

data "aws_security_group" "selected_zookeeper" {
  id = var.zookeeper_sg_id
  #name = "${var.component_name}-${var.region}-sg-${var.environment}-kafka-zookeeper-ec2"
}
