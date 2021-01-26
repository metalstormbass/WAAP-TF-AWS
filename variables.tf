#Company Name
variable "victim_company" {
  type        = string
  description = "For naming purposes"
  default     = "waapdemo"
}

#AWS Region
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

#AWS AZ
variable "primary_az" {
  description = "primary AZ"
  default     = "us-east-1a"
}

#AWS VPC CIDR
variable "aws_vpc_cidr" {
  description = "aws vpc cidr"
  type        = string
}

#AWS Subnet CIDR
variable "aws_subnet_cidr" {
  description = "aws subnet cidr"
  type        = string
}

#Server Private IP
variable "waap_private" {
  description = "waap_private_ip"
  type        = string
}

#Source IP address
variable "source_ip" {
  description = "source ip"
  type        = string
  default = "0.0.0.0/0"
}

#AMI - You must adjust this based on the region you're in
variable "ubuntu_ami" {
  default = "ami-06b263d6ceff0b3dd"
}


#Key Pair Name
variable "key_name" {
  description = "Desired name of AWS key pair"
}

# token
variable "token" {
  type        = string
  description = "WAAP Token"
}