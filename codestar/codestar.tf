variable "access_key" {
  description = "access key"
}

variable "secret_key" {
  description = "secret key"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_codestarconnections_connection" "github_deploy" {
  name          = "automation"
  provider_type = "GitHub"
}
