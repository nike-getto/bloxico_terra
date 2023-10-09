terraform {
  source = "../../../modules/backend/ec2-instance"
}

inputs = {
  instance_type = "t2.micro"
  instance_name = "example-server-stage"
}

include {
  path = find_in_parent_folders()
}