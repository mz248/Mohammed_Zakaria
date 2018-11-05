data "template_file" "user-data" {
  template = "${file("${path.module}/user-data.tpl")}"
}

data "template_cloudinit_config" "user-data" {
  gzip          = true
  base64_encode = true
  #cloud-init template
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.user-data.rendered}"
  }
}

resource "aws_instance" "ec2" {
  ami                     = "${var.ami}"
  instance_type           = "${var.instance_type}"
  key_name                = "${var.key_name}"
  subnet_id               = "${var.subnet_id}"
  vpc_security_group_ids  = ["${var.vpc_security_group_ids}"]
  user_data               = "${data.template_cloudinit_config.user-data.rendered}"
  tags                    = {
    Name = "${var.candidate}-instance"
  }
}
