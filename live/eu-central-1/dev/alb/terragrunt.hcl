include "root" {
	path = find_in_parent_folders()
}

include "envocommon" {
	path = "${dirname(find_in_parent_folders())}/_envcommon/alb.hcl"
}

# You need to specify input object if you want to override input parameters from _envcommon dir