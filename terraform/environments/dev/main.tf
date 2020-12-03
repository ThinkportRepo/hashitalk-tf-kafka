

module "zookeeper" {
  source            = "./../../modules/zookeeper/"
  account_id        = var.account_id
  region            = var.region
  region_ami        = var.region_ami
  environment       = var.environment
  vpc_id            = var.vpc_id
  subnet_id         = data.aws_subnet.sg_main.id
  component_name    = var.component_name
  
  instance_type   = var.instance_type_zk
  instance_count  = var.instance_count_zk
  key_name        = aws_key_pair.generated_key.key_name #var.key_name
  volume_size     = var.volume_size
  node_exporter   = var.node_exporter
  domain          = var.domain
  route53_id      = aws_route53_zone.main_domain.zone_id
  tags            = var.tags
  //baseconfig      = data.template_file.BaseConfig.rendered
  instanceprofile = aws_iam_instance_profile.ec2-iam-kafka-ssm-profile.name
  instancename    = var.instance_name_zk
}


module "kafka" {
  source            = "./../../modules/kafka/"
  account_id        = var.account_id
  region            = var.region
  region_ami        = var.region_ami
  environment       = var.environment
  vpc_id            = var.vpc_id
  subnet_id         = data.aws_subnet.sg_main.id
  component_name    = var.component_name

  instance_type     = var.instance_type_kafka
  instance_count    = var.instance_count_kafka
  key_name          = var.key_name
  port_plain        = var.kafka_port_plain
  port_ssl          = var.kafka_port_ssl
  volume_size       = var.volume_size
  jmx_port          = var.kafka_jmx_port
  node_exporter     = var.node_exporter
  domain            = var.domain
  route53_id        = aws_route53_zone.main_domain.zone_id
  tags              = var.tags
  instanceprofile   = aws_iam_instance_profile.ec2-iam-kafka-ssm-profile.name
  instancename    = var.instance_name_broker
}

module "schema_registry" {
  source            = "./../../modules/schema_registry/"
  account_id        = var.account_id
  region            = var.region
  region_ami        = var.region_ami
  environment       = var.environment
  vpc_id            = var.vpc_id
  subnet_id         = data.aws_subnet.sg_main.id
  component_name    = var.component_name

  instance_type   = var.instance_type_schema_registry
  instance_count  = var.instance_count_schema_registry
  key_name        = var.key_name
  volume_size     = var.volume_size
  jmx_port        = var.kafka_jmx_port
  node_exporter   = var.node_exporter
  domain          = var.domain
  route53_id      = aws_route53_zone.main_domain.zone_id
  tags            = var.tags
  instanceprofile = aws_iam_instance_profile.ec2-iam-kafka-ssm-profile.name
  instancename    = var.instance_name_registry
}

module "control_center" {
  source            = "./../../modules/control_center/"
  account_id        = var.account_id
  region            = var.region
  region_ami        = var.region_ami
  environment       = var.environment
  vpc_id            = var.vpc_id
  subnet_id         = data.aws_subnet.sg_main.id
  component_name    = var.component_name

  instance_type   = var.instance_type_control
  instance_count  = var.instance_count_control
  key_name        = var.key_name
  volume_size     = var.volume_size
  jmx_port        = var.kafka_jmx_port
  node_exporter   = var.node_exporter
  domain          = var.domain
  route53_id      = aws_route53_zone.main_domain.zone_id
  tags            = var.tags
  instanceprofile = aws_iam_instance_profile.ec2-iam-kafka-ssm-profile.name
  instancename    = var.instance_name_control_center
}

module "kafka-cluster-security-group" {
 source = "./../../modules/kafka-cluster-security-group/"

 security_group_list  = list(module.schema_registry.sr_sg_id,module.control_center.cc_sg_id)
 kafka_sg_id          = module.kafka.kafka_sg_id
 zookeeper_sg_id      = module.zookeeper.zookeeper_sg_id
 component_name       = var.component_name
 kafka_instance_count = var.instance_count_kafka
 account_id           = var.account_id
 region               = var.region
 environment          = var.environment

 depends_on = [module.zookeeper,module.kafka,module.schema_registry,module.control_center]
}

terraform {
  required_version = ">= 0.13"
}
