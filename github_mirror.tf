resource github_repository main {
	count = var.github_mirror != null ? 1 : 0
	
	name = var.github_mirror.name
	is_template = var.github_mirror.is_template
	description = var.description
	homepage_url = var.github_mirror.homepage_url
	topics = [ for topic in var.topics: lower( topic ) ]
	
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
	url = replace( github_repository.main[0].ssh_clone_url, "/^(.+):(.+)$/", "ssh://$1/$2" )
	auth_method = "ssh_public_key"
}


data gitlab_project_mirror_public_key main {
	count = var.github_mirror != null ? 1 : 0
	
	project_id = gitlab_project.main.id
	mirror_id = gitlab_project_mirror.main[0].mirror_id
}


resource github_repository_deploy_key main {
	count = var.github_mirror != null ? 1 : 0
	
	repository = github_repository.main[0].name
	title = "GitLab Mirror SSH Key"
	key = data.gitlab_project_mirror_public_key.main[0].public_key
	read_only = false
}