#Build VPC
resource "aws_vpc" "waapdemovpc" {
  cidr_block = var.aws_vpc_cidr
  tags = {
    Name = ${var.victm_company}-vpc
  }
}


# Create a subnet
resource "aws_subnet" "external" {
  vpc_id                  = aws_vpc.waapdemovpc.id
  cidr_block              = var.aws_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.primary_az
  tags = {
    Name = ${var.victm_company}-subnet
  }
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default_internet_gateway" {
  vpc_id = aws_vpc.waapdemovpc.id
}



#Create security groups 

resource "aws_security_group" "waap_ssh" {
  name = "${var.victm_company}-ssh-sg"
  vpc_id = aws_vpc.waapdemovpc.id
ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.source_ip]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.source_ip]
  }
tags {
    "Name" = "${var.victm_company}-ssh-sg"
  }
}
resource "aws_security_group" "waap_http" {
  name = "${var.victm_company}-http-sg"
  vpc_id = aws_vpc.waapdemovpc.id
ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = [var.source_ip]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.source_ip]
  }
tags {
    "Name" = ${var.victm_company}-ssh-sg
  }
}