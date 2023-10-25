terraform {
  source  = "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=latest"
}

generate "provider" {
	path = "provider.tf"
	if_exists = "overwrite_terragrunt"
	contents = <<EOF
provider "aws" {
	region = "eu-central-1"
}
EOF
}

inputs = {
	name = "my-vpc"
	cidr = "10.0.0.0/16"

	azs = ["eu-central-1a", "eu-central-1b"]
	private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
	public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

	enable_nat_gateway = true
	enable_vpn_gateway = true

	tags = {
		Terraform = "true"
		Environment = "dev"
	}
}