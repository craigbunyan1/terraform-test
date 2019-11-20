provider "aws" {
	region = "eu-west-2"
}

resource "aws_s3_bucket" "b3" {
  bucket = "terraform-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My fourth bucket - ci test"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket = "testing-test-tf-bucket-ci"
    key    = "network/terraform.tfstate"
    region = "eu-west-2"
  }
}
