locals {
	# Automatically load account-level variables
	account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

	# Automatically load region-level variables
	region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

	# Automatically load environment-level variables
	environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

	# Extract the variables we need for easy access
	account_name = local.account_vars.locals.account_name
	account_id = local.account_vars.locals.aws_account_id
	aws_region = local.region_vars.aws_region
}

# Generate an AWS provide block
generate "provider" {
	path = "provider.tf"
	if_exists = "overwrite_terragrunt"
	contents = <<EOF
provider "aws" {
	region = "${local.aws_region}"

	# Only these account IDs may be operated on this template
	allowed_account_ids = ["${local.account_id}"]
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in S3 bucket
remote_state {
	backend = "s3"
	config = {
		encrypt = true
		bucket = "${get_env("TG_BUCKET_PREFIX", "")}terragrunt-example-tf-state-${local.account_name}-${local.aws_region}"
		key = "${path_relative_to_include()}/terraform.tfstate"
		region = local.aws_region
		dynamodb_table = "terraform-locks"
	}
	generate = {
		path = "backend.tf"
		if_exists = "overwrite_terragrunt"
	}
}