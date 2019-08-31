output "digitalocean-project-id" {
  value = "${digitalocean_project.project.id}"
}

output "digitalocean-project-name" {
  value = "${var.project_name}"
}

output "digitalocean-project-environment" {
  value = "${var.environment}"
}

