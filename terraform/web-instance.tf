# Specify the provider and access details
provider "aws" {
    region = "${var.aws_region}"

}

resource "aws_instance" "web" {
    ami = "ami-31490d51"
     instance_type = "t2.micro"
     tags {
         Name = "HelloWorld"
     }
}
