resource github_repository main {
	count = var.github_mirror != null ? 1 : 0
	
	name = var.github_mirror.name
	description = var.description
	homepage_url = var.github_mirror.homepage_url
	is_template = var.github_mirror.is_template
	
	has_issues = true
	has_projects = false
	has_wiki = false
}


resource gitlab_project_mirror main {
	count = var.github_mirror != null ? 1 : 0
	
	project = gitlab_project.main.id
	# TODO: Fix this.
	url = replace( github_repository.main[0].http_clone_url, "/\\/\\//", "//Marcelotsvaz:password@" )
}