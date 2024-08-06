# 
# Naming
#-------------------------------------------------------------------------------
variable name {
	description = "Pretty name."
	type = string
}

variable path {
	description = "Path, without namespace."
	type = string
}

variable namespace {
	description = "Namespace."
	type = string
}


# 
# General
#-----------------------------------------------------------
variable topics {
	type = list( string )
	default = []
}

variable description {
	type = string
	default = ""
}

variable avatar {
	type = string
	default = null
}

variable visibility_level {
	type = string
	default = "public"
}

variable features {
	type = object( {
		issues_enabled = optional( bool, true )
		
		repository_access_level = optional( string, "enabled" )
		merge_requests_access_level = optional( string, "enabled" )
		forking_access_level = optional( string, "enabled" )
		lfs_enabled = optional( bool, true )
		builds_access_level = optional( string, "disabled" )
		
		container_registry_access_level = optional( string, "disabled" )
		analytics_access_level = optional( string, "enabled" )	# Enabled.
		security_and_compliance_access_level = optional( string, "disabled" )
		wiki_access_level = optional( string, "disabled" )
		snippets_access_level = optional( string, "disabled" )
		packages_enabled = optional( bool, false )
		model_experiments_access_level = optional( string, "disabled" )
		model_registry_access_level = optional( string, "disabled" )
		pages_access_level = optional( string, "disabled" )
		monitor_access_level = optional( string, "disabled" )
		environments_access_level = optional( string, "disabled" )
		feature_flags_access_level = optional( string, "disabled" )
		infrastructure_access_level = optional( string, "disabled" )
		releases_access_level = optional( string, "disabled" )
		
		service_desk_enabled = optional( bool, false )
	} )
	default = {}
}


# 
# CI/CD
#-----------------------------------------------------------
variable cicd {
	type = object( {
		shared_runners_enabled = optional( bool, false )
	} )
	default = {}
}