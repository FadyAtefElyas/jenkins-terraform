# the k8s cluster service acc

resource "google_service_account" "kubernetes_cluster_sa" {
  account_id   = var.account2_id
  display_name = var.account2_display_name
}

resource "google_project_iam_member" "my_service_account_roles" {
  project = google_service_account.kubernetes_cluster_sa.project
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.kubernetes_cluster_sa.email}"
}


