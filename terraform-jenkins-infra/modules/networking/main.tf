variable "vpc_cidr" {}
variable "vpc_name" {}
variable "cidr_public_subnet" {}
variable "eu_availability_zone" {}
variable "cidr_private_subnet" {}

#setup vpc
resource "aws_vpc" "jenkins_vpc_eu_west_1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Setup public subnet
resource "aws_subnet" "public_subnets" {
  count             = length(var.cidr_public_subnet)
  vpc_id            = aws_vpc.jenkins_vpc_eu_west_1.id
  cidr_block        = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Setup private subnet
resource "aws_subnet" "private_subnets" {
  count             = length(var.cidr_private_subnet)
  vpc_id            = aws_vpc.jenkins_vpc_eu_west_1.id
  cidr_block        = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

# Setup Internet Gateway
resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.jenkins_vpc_eu_west_1.id
  tags = {
    Name = "dev-proj-1-igw"
  }
}
