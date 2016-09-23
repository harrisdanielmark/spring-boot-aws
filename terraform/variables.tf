variable "aws_region" {
    description = "AWS region to launch servers."
    default = "us-west-1"
}


############################
#DB Vars, put into own file?
############################
variable "aws_db_name" {}

variable "aws_db_username" {}

variable "aws_db_password" {}



############################
#Security Group vars, put into own file?
############################

variable "cidr_blocks" {
  default = "0.0.0.0/0"
  description = "CIDR for sg"
}


variable "sg_name" {
  default = "rds_sg"
  description = "Tag Name for sg"
}


############################
#Subnet vars, put into own file?
############################

#Need to add VPC befire making use of all the subnet configs

#variable "subnet_1_cidr" {
#  default = "10.0.1.0/24"
#  description = "Your AZ"
#}
#
#variable "subnet_2_cidr" {
#  default = "10.0.2.0/24"
#  description = "Your AZ"
#}
#

# what are these?   availablity from the VPC?
#variable "az_1" {
#  default = "us-east-1b"
#  description = "Your Az1, use AWS CLI to find your account specific"
#}
#
#variable "az_2" {
#  default = "us-east-1c"
#  description = "Your Az2, use AWS CLI to find your account specific"
#}
#
#variable "vpc_id" {
#  description = "Your VPC ID"
#}