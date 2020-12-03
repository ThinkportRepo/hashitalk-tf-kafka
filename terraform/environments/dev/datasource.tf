#########################################################
# Data
#########################################################

data "aws_availability_zones" "available" {
}

data "aws_subnet" "sg_main" {
  id = "subnetId"
}
