#####
#     Variable setup
#####
################################
## mandotory stuff
################################

variable "account_id" {
  type        = string
  description = "ID of AWS-Account to be used"
  default     = "accountid"
}

variable "vpc_id" {
  type = string
  description = "(optional) describe your variable"
  default = "vpcId"
}

variable "environment" {
  type        = string
  description = "Environment of instance"
  default     = "DEV"
}

variable "profile" {
  type        = string
  default = "default"
}

variable "owner" {
  type        = string
  default = "thinkport"
}

################################
## Instance setup Brokers
################################
// FIXME: Change machine type later
variable "instance_type_kafka" {
  type        = string
  description = "Type of instance to be used (at least 2G memory)"
  default     = "t2.medium"
}

variable "instance_count_kafka" {
  type        = string
  description = "Number of instances to be deployed"
  default     = "5"
}

variable "instance_name_broker" {
  type        = string
  description = "Name of kafka component used for instance name"
  default     = "kafka-broker"
}

################################
## Instance setup Zookeepers
################################
################################################
variable "instance_type_zk" {
  type        = string
  description = "Type of instance to be used (at least 2G memory)"
  default     = "t2.medium"
}

variable "instance_count_zk" {
  type        = string
  description = "Number of instances to be deployed"
  default     = "3"
}

variable "instance_name_zk" {
  type        = string
  description = "Name of kafka component used for instance name"
  default     = "kafka-zookeeper"
}

################################
## Instance setup Kafka schema_registry
################################
variable "instance_type_schema_registry" {
  type        = string
  description = "Type of instance to be used (at least 2G memory)"
  default     = "t2.medium"  #"t2.medium"
}

variable "instance_count_schema_registry" {
  type        = string
  description = "Number of instances to be deployed"
  default     = "1"
}
variable "instance_name_registry" {
  type        = string
  description = "Name of kafka component used for instance name"
  default     = "kafka-schema-registry"
}


################################
## Instance setup Kafka control center
################################
variable "instance_type_control" {
  type        = string
  description = "Type of instance to be used (at least 2G memory)"
  default     = "t2.medium"  #"t2.medium"
}

variable "instance_count_control" {
  type        = string
  description = "Number of instances to be deployed"
  default     = "1"
}

variable "instance_name_control_center" {
  type        = string
  description = "Name of kafka component used for instance name"
  default     = "kafka-control-center"
}

################################
## Key Name
################################

variable "key_name" {
  type        = string
  description = "Name of key to put into key_name for instance"
  default     =  "HASHITALKS-Key"
}

################################
## Component name
################################
variable "component_name" {
  type        = string
  description = "Name of the component that is running this module"
  default     = "HASHITALKS"
}

################################
## Kafka Ports
################################
variable "kafka_jmx_port" {
  type        = string
  description = "Port for JMX Connection"
  default     = "9090"
}

variable "node_exporter" {
  type        = string
  description = "Port for JMX Connection"
  default     = "9100"
}

variable "kafka_port_ssl" {
  type        = string
  description = "Port to use for secure communication with Kafka brokers"
  default     = "9093"
}

variable "kafka_port_plain" {
  type        = string
  description = "Port to use for plaintext communication with Kafka brokers"
  default     = "9092"
}

################################
## volume size
################################
variable "volume_size" {
  type        = string
  description = "Root volume size for Kafka broker machines"
  default     = 20 # 1TB
}


################################
## AMI setup
################################
variable "region_ami" {
  type = map(string)
  default = {
    // Generated from TF Packer
    eu-central-1 = "ami-058700fb7714bfb05"

  }
}

variable "region" {
  type        = string
  description = "Region"
  default     = "eu-central-1"
}

################################
## Networking setup
################################
# DNS Routing
variable "domain" {
  default = "hashitalks."
}

