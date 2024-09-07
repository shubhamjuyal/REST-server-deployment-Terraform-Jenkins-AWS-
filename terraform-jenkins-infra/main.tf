
module "networking" {
  source               = "./modules/networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  cidr_public_subnet   = var.cidr_public_subnet
  eu_availability_zone = var.eu_availability_zone
  cidr_private_subnet  = var.cidr_private_subnet
}

module "aws_security_groups" {
  source              = "./modules/security-groups"
  ec2_sg_name         = "SG for EC2 to enable SSH(22), HTTPS(443) and HTTP(80)"
  vpc_id              = module.networking.vpc_id
  ec2_jenkins_sg_name = "SG to Allow port 8080 for jenkins"
}

module "ec2" {
  source                    = "./modules/ec2"
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  public_key                = var.public_key
  sg_for_jenkins            = [module.aws_security_groups.id_of_ec2_sg_ssh_http, module.aws_security_groups.id_of_ec2_jenkins_sg_port_8080]
  enable_public_ip_address  = true
  tag_name                  = var.tag_name
  subnet_id                 = var.cidr_public_subnet
  user_data_install_jenkins = templatefile("./jenskins-installer.sh", {})
}
