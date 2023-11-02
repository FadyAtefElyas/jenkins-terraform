# VPC
resource "google_compute_network" "this" {
  name                            = "${var.name}-vpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}
resource "google_compute_subnetwork" "subnet1" {
  name          = var.subnet1_name
  ip_cidr_range = var.subnet1_cidr
  region        = var.subnet1_region
  network       = google_compute_network.this.name

}

resource "google_compute_subnetwork" "subnet2" {
  name          = var.subnet2_name
  ip_cidr_range = var.subnet2_cidr
  region        = var.subnet2_region
  network       = google_compute_network.this.name
}