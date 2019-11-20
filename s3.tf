provider "aws" {
	region = "eu-west-2"
}

resource "aws_s3_bucket" "bucket10" {
  bucket = "something_completely_different"
  acl    = "private"

  tags = {
    Name        = "This is something completely different, to avoid confusion"
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
