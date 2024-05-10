resource "google_compute_subnetwork" "private" {
  count = length(var.private_subnets)

  name                     = "${var.env}-private-subnet-${count.index}"
  ip_cidr_range            = var.private_subnets[count.index]
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = var.k8s_pod_range[count.index]
  }

  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = var.k8s_service_range[count.index]
  }
}

resource "google_compute_subnetwork" "public" {
  count = length(var.public_subnets)

  name          = "${var.env}-public-subnet-${count.index}"
  ip_cidr_range = var.public_subnets[count.index]
  region        = var.region
  network       = google_compute_network.this.id
}