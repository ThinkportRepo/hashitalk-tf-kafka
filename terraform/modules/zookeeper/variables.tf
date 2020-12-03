variable "account_id" {
  type = string
  description = "ID of currently used Account"
}

variable "vpc_id" {
  type        = string
  description = "Name of VPC to deploy into"
}

variable "subnet_id" {
  type = string
  description = "(optional) describe your variable"
}

variable "environment" {
  type        = string
  description = "Environment of instance"
}

variable "domain" {
  type        = string
  description = "Domain for LoadBalancer and DNS"
}

variable "route53_id" {
  type        = string
  description = "ID for LoadBalancer and DNS"
}

variable "instance_type" {
  type        = string
  description = "Type of instance to be used (at least 2G memory)"
}

variable "key_name" {
  type        = string
  description = "Name of key to put into key_name for instance"
}

variable "availability_zone" {
  type        = list(string)
  description = "The availability zone where the instances should be started"
  default     = ["eu-central-1b"]
}

variable "instance_count" {
  type        = string
  description = "Number of instances to be deployed"
}

variable "component_name" {
  type        = string
  description = "Name of the component that is running this module"
}

variable "zookeeper_client_port" {
  type        = string
  description = "Is used by ZooKeeper clients to connect to the ZooKeeper servers"
  default     = "2181"
}

variable "zookeeper_internal" {
  type        = string
  description = "Is used by peer ZooKeeper servers to communicate with each other"
  default     = "2888"
}

variable "zookeeper_election" {
  type        = string
  description = "Is used by peer ZooKeeper for leader election"
  default     = "3888"
}

variable "jmx_port" {
  type        = string
  description = "Port for JMX Connection"
  default     = "9090"
}

variable "node_exporter" {
  type        = string
  description = "Port for Prometheus Node exporter"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "region_ami" {
  description = "Region ami"
}

variable "volume_size" {
  type        = string
  description = "Root volume size for Kafka broker machines"                                     
}

variable "tags" {
  type        = map(string)
  description = "default tags to use"
}

/*
variable "baseconfig" {
  description = "Cloud-Init-Template"
}
*/
variable "instanceprofile" {
  type        = string
  description = "Enable SSM"
}

variable "instancename" {
  type        = string
  description = "Name of kafka component used for instance name"
}
