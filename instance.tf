resource "google_compute_instance" "first_vm" {
  name                      = var.instance_name
  machine_type              = var.machine_type
  zone                      = var.machine_zone
  allow_stopping_for_update = true
  tags                      = ["ssh"]
  metadata_startup_script   = file("startup-script.sh")

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  service_account {
    email  = google_service_account.kubernetes_engine_developer.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  network_interface {
    network    = google_compute_network.this.self_link
    subnetwork = google_compute_subnetwork.subnet1.name
  }

}