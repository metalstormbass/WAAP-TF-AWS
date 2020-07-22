#Variable Processing
# Setup the userdata that will be used for the instance
data "template_file" "userdata_setup" {
  template = "${file("userdata_setup.template")}"

  vars  = {
    name       = "${var.username}"
    token     = "${var.token}"
    logic = "${file("vuln_bootstrap.sh")}"
  }
}


resource "aws_instance" "vuln_vm" {
  ami           = "${var.ubuntu_ami}"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.eternal.id
  vpc_security_group_ids = [aws_security_group.waap_ssh.id, aws_security_group.waap_http.id]
  key_name = "${var.key_pair_name}"
  user_data = data.template_file.userdata_setup.rendered
  tags {
    "Name" = "${var.victm_company}-vm"
  }
}