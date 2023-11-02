provider "google" {
  project     = var.project_id
  credentials = file("fady-401509-db33db87056c.json")
  region      = var.project_region
}


