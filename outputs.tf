output "public_ip" {
  value = "${module.ec2.public_ip}"
}
#output "dns_name" {
 # value = "${module.elb.dns_name}"
#}
# ...
