# the management-instance -service -account
resource "google_service_account" "kubernetes_engine_developer" {
  account_id   = var.account_id
  display_name = var.account_display_name
}
resource "google_project_iam_member" "kubernetes_engine_developer_role" {
  project = google_service_account.kubernetes_engine_developer.project
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.kubernetes_engine_developer.email}"
}
resource "google_project_iam_member" "kubernetes_engine_developer_role2" {
  project = google_service_account.kubernetes_engine_developer.project
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.kubernetes_engine_developer.email}"
}

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

/* resource "google_project_iam_custom_role" "custom_role" {
     role_id   = var.custom_role_id
     title     = var.custom_role_title
     stage     = "GA"
     permissions = [
       "container.pods.attach",
       "container.pods.create",
       "container.pods.delete",
       "container.pods.get",
       "container.pods.getLogs",
       "container.pods.getStatus",
       "container.pods.initialize",
       "container.pods.list",
       "container.pods.portForward",
       "container.pods.proxy",
       "container.pods.update",
       "container.pods.updateStatus",
       "container.cluster.get",
       "container.cluster.list"
     ]
   }*/