
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "candidate" {}
provider "aws" {
    region = "us-east-1"
    profile = "default"
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
}

module "ec2" {
    source = "module/"
    ami = "ami-9887c6e7"
    instance_type = "t2.micro"
    key_name = "case-study"
    subnet_id = "subnet-086f3ed6742f38a16"
    vpc_security_group_ids = ["sg-03e9111b3bb9f8b40"]
    candidate = "${var.candidate}"
    tags = {
         Name  = "${var.candidate}-instance"

 }
}
#resource "aws_instance" "example"{}
