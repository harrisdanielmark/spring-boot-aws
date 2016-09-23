
############################
#Security Group Config
############################

resource "aws_security_group" "db_instance_security_group" {
  name = "db_instance_security_group"
  description = "security group for mysql instance"

  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "TCP"
      cidr_blocks =  ["${var.cidr_blocks}"]
  }


  tags {
    Name = "${var.sg_name}"
  }

}


############################
# subnet config
############################


## Will need to set up VPC before adding subnet groups

#resource "aws_subnet" "subnet_1" {
#  vpc_id = "${var.vpc_id}"
#  cidr_block = "${var.subnet_1_cidr}"
##  availability_zone = "${var.az_1}"
#
#  tags {
#    Name = "main_subnet1"
#  }
#}

#resource "aws_subnet" "subnet_2" {
#  vpc_id = "${var.vpc_id}"
#  cidr_block = "${var.subnet_2_cidr}"
##  availability_zone = "${var.az_2}"
#
#  tags {
#    Name = "main_subnet2"
#  }
#}
#


#resource "aws_db_subnet_group" "default" {
#  name = "main_subnet_group"
#  description = "Our main group of subnets"
#  subnet_ids = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
#}

############################
# DB Config
############################

resource "aws_db_instance" "rds" {
  identifier           = "default-aws-db"
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.6.27"
  instance_class       = "db.t2.micro"
  name                 = "${var.aws_db_name}"
  username             = "${var.aws_db_username}"
  password             = "${var.aws_db_password}"
  vpc_security_group_ids = ["${aws_security_group.db_instance_security_group.id}"]
#  db_subnet_group_name = "${aws_db_subnet_group.default.id}"
  parameter_group_name = "default.mysql5.6"
  backup_retention_period = 7
  apply_immediately  = true
}

output "rds_address" {
  value = "${aws_db_instance.rds.address}"
}