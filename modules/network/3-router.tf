# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "this" {
  name    = "${var.env}-router"
  region  = var.region
  network = google_compute_network.this.id
}
