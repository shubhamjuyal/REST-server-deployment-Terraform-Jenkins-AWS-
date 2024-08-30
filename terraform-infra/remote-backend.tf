terraform {
  backend "s3" {
    bucket = ""
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}
