
variable "component_name" {
  type        = string
  description = "Name of the component that is running this module"
}

variable "security_group_list" {
  type        = list(string)
  description = "The names of the security groups which should be configured"
}

variable "kafka_sg_id" {
  type = string
  description = "(optional) describe your variable"
}

variable "zookeeper_sg_id" {
  type = string
  description = "(optional) describe your variable"
}

variable "kafka_instance_count" {
  type        = string
  description = "Number of instances to be deployed"
}


variable "account_id" {
  type        = string
  description = "ID of AWS-Account to be used"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "environment" {
  type        = string
  description = "Environment of instance"
}
