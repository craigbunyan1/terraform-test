provider "aws" {
	region = var.AWS_REGION
}

resource "aws_s3_bucket" "bucket" {
  bucket = "something-completely-different"
  acl    = "private"
  tags   = {
            Name        = "Tf test bucket"
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
