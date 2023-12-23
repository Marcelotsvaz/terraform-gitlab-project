data gitlab_group main {
	full_path = var.namespace
}


resource gitlab_project main {
	name = var.name
	path = var.path
	namespace_id = data.gitlab_group.main.id
}