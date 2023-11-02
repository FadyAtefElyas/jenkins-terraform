resource "google_compute_router" "router" {
  name    = var.router_name
  network = google_compute_network.this.id
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
  }
}

resource "google_compute_router_nat" "router_nat" {
  name                               = var.router_nat_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.subnet1.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}