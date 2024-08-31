terraform {
  backend "s3" {
    # bucket = "your bucket name" // or else it will be asked on `terraform apply`
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}
