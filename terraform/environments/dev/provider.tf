#####
#     Provider setup
#####

provider "aws" {
   version = "~> 3.0"
   region  = "eu-central-1"
 }

terraform {
  backend "s3" {
    bucket  = "YourBucket-terraformstates" 
    key     = "hashitalks/kafka_infra.tfstate"
    region  = "eu-central-1"
  }
}
