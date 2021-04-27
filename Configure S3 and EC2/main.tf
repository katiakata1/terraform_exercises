provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

resource "aws_instance" "EC2" {
  ami           = var.ami-id
  instance_type = var.instance-type
  # key_name      = "example"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-duper-super-special-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}