provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0bee957a0fa02a297"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
