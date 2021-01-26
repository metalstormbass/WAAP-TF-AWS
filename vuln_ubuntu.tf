#Variable Processing
# Setup the userdata that will be used for the instance
data "template_file" "userdata_setup" {
  template = "${file("userdata_setup.template")}"

  vars  = {
    token     = "${var.token}"
    logic = "${file("vuln_bootstrap.sh")}"
  }
}


resource "aws_instance" "vuln_vm" {
  availability_zone = var.primary_az
  ami           = var.ubuntu_ami
  instance_type = "t2.micro"
  key_name = var.key_name
  network_interface {
        device_index = 0
        network_interface_id = aws_network_interface.waap-nic.id
  }
  
  user_data = data.template_file.userdata_setup.rendered
 
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.vuln_vm.public_ip
}