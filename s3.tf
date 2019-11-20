provider "aws" {
	region = "eu-west-2"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "something-completely-different"
  acl    = "private"
}

terraform {
  backend "s3" {
    bucket = "testing-test-tf-bucket-ci"
    key    = "network/terraform.tfstate"
    region = "eu-west-2"
  }
}
