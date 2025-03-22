terraform {
	required_version = ">= 1.6.4"
	
	required_providers {
		gitlab = {
			source = "gitlabhq/gitlab"
			version = ">= 17.10.0"
		}
		
		github = {
			source = "integrations/github"
			version = ">= 6.2.3"
		}
	}
}