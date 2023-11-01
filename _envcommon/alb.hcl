terraform {
	source = "${local.base_source_url}?ref=v0.7.0"
}

locals {
	# Automatically load environment-level variables
	environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

	# Extract out common variables for reuse
	env = local.environment_vars.locals.environment

	# Exposing base source URL so different versions of the module can be deployed in different environments. This
	# will be used to construct the terraform block in the child terragrunt configurations.
	base_source_url = "https://github.com/cloudposse/terraform-aws-components/tree/main/modules/alb"
}
	
# MODULE PARAMETERS
inputs = {
	alb_name = "alb_${local.env}"
	is_internal_alb = false
	ssl_policy = ""
	vpc_subnet_ids = []
}
