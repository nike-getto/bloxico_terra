remote_state {
	backend = "s3"
	
	generate = {
		path = "backend.tf"
		if_exists = "overwrite_terragrunt"
	}
	
	config = {
		bucket = "bloxico-backend-grunt"

		key = "${path_relative_to_include()}/terraform.tfstate"
		region = "eu-central-1"
		encrypt = true
		dynamodb_table = "my_lock_table"
	}
}