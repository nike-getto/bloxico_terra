# Set account-wide variables. These are automatically pulled in to configure the remote state bucket
# in the root "terragrunt.hcl" configuration

locals {
	account_name = "non-prod"
	aws_account_id = "497935891301"
	aws_profile = "non-prod"
}