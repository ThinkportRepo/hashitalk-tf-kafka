variable "account_id" {
  type = string
  description = "ID of currently used Account"
}

variable "vpc_id" {
  type        = string
  description = "ID of VPC to deploy into"
}

variable "subnet_id" {
  type = string
  description = "(optional) describe your variable"
}


variable "environment" {
  type        = string
  description = "Environment of instance"
}

variable "region" {
  type        = string
  description = "Region of the kafka brokers"
}

variable "domain" {
  type        = string
  description = "Domain for LoadBalancer and DNS"
}

variable "route53_id" {
  type        = string
  description = "ID for LoadBalancer and DNS"
}

variable "region_ami" {
  description = "Region ami of the kafka brokers"
}

variable "instance_type" {
  type        = string
  description = "Type of instance to be used (at least 2G memory)"
}

variable "availability_zone" {
  type        = list(string)
  description = "The availability zone where the instances should be started"
  default     = ["eu-central-1b"]
}

variable "key_name" {
  type        = string
  description = "Name of key to put into key_name for instance"
}

variable "instance_count" {
  type        = string
  description = "Number of instances to be deployed"
}

variable "component_name" {
  type        = string
  description = "Name of the component that is running this module"
}

variable "jmx_port" {
  type        = string
  description = "Port for JMX Connection"
}

variable "node_exporter" {
  type        = string
  description = "Port for Prometheus Node exporter"
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

