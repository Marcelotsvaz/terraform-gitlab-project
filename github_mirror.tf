resource github_repository main {
	count = var.github_mirror != null ? 1 : 0
	
	name = var.github_mirror.name
	is_template = var.github_mirror.is_template
	description = var.description
	homepage_url = var.github_mirror.homepage_url
	topics = var.topics
	
	has_issues = true
	has_projects = false
	has_wiki = false
}


resource github_actions_repository_permissions main {
	count = var.github_mirror != null ? 1 : 0
	
	repository = github_repository.main[0].name
	enabled = false
}


resource gitlab_project_mirror main {
	count = var.github_mirror != null ? 1 : 0
	
	project = gitlab_project.main.id
	# TODO: Fix this.
	url = replace( github_repository.main[0].http_clone_url, "/\\/\\//", "//git:password@" )
}