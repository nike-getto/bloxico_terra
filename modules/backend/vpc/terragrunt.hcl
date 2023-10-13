terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v2.18.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../aws-data"]
}

dependency "aws-data" {
  config_path = "../aws-data"
}

inputs = {
  azs = [for v in dependency.aws-data.outputs.available_aws_availability_zones_names : v]

  cidr = "10.0.0.0/16"

  database_subnets = [for k, v in dependency.aws-data.outputs.available_aws_availability_zones_names : cidrsubnet("10.0.0.0/16", 8, k + 20)]

  name = "prod"

  private_subnets = [for k, v in dependency.aws-data.outputs.available_aws_availability_zones_names : cidrsubnet("10.0.0.0/16", 8, k + 10)]
	
  public_subnets = [for k, v in dependency.aws-data.outputs.available_aws_availability_zones_names : cidrsubnet("10.0.0.0/16", 8, k)]

  enable_nat_gateway = true

  single_nat_gateway = true

  enable_dns_hostnames = true

  enable_dns_support = true

  tags = {
    Environment = "prod"
  }

}