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

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "testing-test-tf-bucket-ci"
    key    = "network/terraform.tfstate"
    region = "eu-west-2"
  }
}
