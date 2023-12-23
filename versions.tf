terraform {
	required_version = ">= 1.6.4"
	
	required_providers {
		gitlab = {
			source = "gitlabhq/gitlab"
			version = ">= 16.6.0"
		}
	}
}