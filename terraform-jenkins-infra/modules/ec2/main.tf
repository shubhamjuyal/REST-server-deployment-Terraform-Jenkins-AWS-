variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "public_key" {}
variable "subnet_id" {}
variable "sg_for_jenkins" {}
variable "enable_public_ip_address" {}
variable "user_data_install_jenkins" {}


resource "aws_instance" "ec2_jenkins" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id[0]
  vpc_security_group_ids      = var.sg_for_jenkins
  associate_public_ip_address = var.enable_public_ip_address
  user_data                   = var.user_data_install_jenkins

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  key_name = "aws_for_terraform"
  tags = {
    Name = var.tag_name
  }
}

resource "aws_key_pair" "public_key_for_jenkins_instance" {
  key_name   = "aws_for_terraform"
  public_key = var.public_key
}
