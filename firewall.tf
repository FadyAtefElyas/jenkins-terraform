#//https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

resource "google_compute_firewall" "allow_ssh_from_iap" {
  name    = "allow-ssh-from-iap"
  network = google_compute_network.this.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["ssh"]
}
