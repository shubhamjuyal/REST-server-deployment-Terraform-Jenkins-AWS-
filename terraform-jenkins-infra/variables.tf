variable "remote_bakcend_bucket" {
  type        = string
  description = "Remote state bucket name"
}

variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
}

variable "vpc_name" {
  type        = string
  description = "DevOps Project 1 VPC 1"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "eu_availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}

variable "public_key" {
  type        = string
  description = "Jenkins EC2 server public key"
}

variable "ami_id" {
  type        = string
  description = "ami id for jenkins ec2 instance"
}

variable "instance_type" {
  type        = string
  description = "instance type for jenkins ec2 instance"
}

variable "tag_name" {
  type        = string
  description = "tag name for jenkins ec2 instance"
}
