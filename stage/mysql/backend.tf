# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "bloxico-backend-grunt"
    dynamodb_table = "my_lock_table"
    encrypt        = true
    key            = "mysql/terraform.tfstate"
    region         = "eu-central-1"
  }
}
