resource "aws_instance" "sample_ec2" {
  ami           = "ami-02b49a24cfb95941c"
  instance_type = "t2.micro"
  subnet_id     = ""
  key_name      = ""

  tags = {
    Name = ""
  }
}
