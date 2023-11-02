resource "google_artifact_registry_repository" "my-repo" {
  location      = var.repo_location
  repository_id = var.repo_id
  description   = var.repo_discription
  format        = "DOCKER"
}