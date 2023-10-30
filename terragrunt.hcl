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