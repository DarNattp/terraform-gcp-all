# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "router" {
  name    = "dev-router"
  region  = "asia-southeast1"
  network = google_compute_network.main.id
}
