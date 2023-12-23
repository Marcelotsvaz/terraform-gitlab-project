data gitlab_group main {
	full_path = var.namespace
}


resource gitlab_project main {
	name = var.name
	path = var.path
	namespace_id = data.gitlab_group.main.id
	
	topics = var.topics
	description = var.description
	visibility_level = var.visibility_level
	
	issues_enabled = var.features.issues_enabled
	repository_access_level = var.features.repository_access_level
	merge_requests_access_level = var.features.merge_requests_access_level
	forking_access_level = var.features.forking_access_level
	lfs_enabled = var.features.lfs_enabled
	builds_access_level = var.features.builds_access_level
	container_registry_access_level = var.features.container_registry_access_level
	analytics_access_level = var.features.analytics_access_level
	security_and_compliance_access_level = var.features.security_and_compliance_access_level
	wiki_access_level = var.features.wiki_access_level
	snippets_access_level = var.features.snippets_access_level
	packages_enabled = var.features.packages_enabled
	# model_experiments_access_level = var.features.model_experiments_access_level
	# model_registry_access_level = var.features.model_registry_access_level
	pages_access_level = var.features.pages_access_level
	monitor_access_level = var.features.monitor_access_level
	environments_access_level = var.features.environments_access_level
	feature_flags_access_level = var.features.feature_flags_access_level
	infrastructure_access_level = var.features.infrastructure_access_level
	releases_access_level = var.features.releases_access_level
	# service_desk_enabled = var.features.service_desk_enabled
}



# 
# Branch and Tag Protection
#-------------------------------------------------------------------------------
resource gitlab_tag_protection main {
	project = gitlab_project.main.id
	tag = "*"
	create_access_level = "maintainer"
}