#Company Name
variable "victim_company" {
  type        = string
  description = "For naming purposes"
  default     = "waapdemo"
}

#AWS Region
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-2"
}

#AWS AZ
variable "primary_az" {
  description = "primary AZ"
  default     = "us-east-2a"
}

#AWS VPC CIDR
variable "aws_vpc_cidr" {
  description = "aws vpc cide"
  type        = string
}

#AWS Subnet CIDR
variable "aws_subnet_cidr" {
  description = "aws subnet cidr"
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
  description = "Desired name of AWS key pair"
  default = "ami-0a63f96e85105c6d3"
}


#Key Pair Name
variable "key_name" {
  description = "Desired name of AWS key pair"
}

# username
variable "username" {
  type        = string
  description = "Username"
}

# password
variable "password" {
  type        = string
  description = "Password"
}

# token
variable "token" {
  type        = string
  description = "WAAP Token"
}