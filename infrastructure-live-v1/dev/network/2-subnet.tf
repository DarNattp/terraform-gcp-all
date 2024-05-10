resource "google_compute_subnetwork" "private_asia_southeast1_a" {
  name                     = "dev-private-subnet-1"
  ip_cidr_range            = "10.0.0.0/19"
  region                   = "asia-southeast1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }

  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}

resource "google_compute_subnetwork" "private_asia_southeast1_b" {
  name                     = "dev-private-subnet-b"
  ip_cidr_range            = "10.0.32.0/19"
  region                   = "asia-southeast1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.64.0.0/14"
  }

  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.68.0.0/20"
  }
}

resource "google_compute_subnetwork" "public_asia_southeast1_a" {
  name          = "dev-public-subnet-a"
  ip_cidr_range = "10.0.64.0/19"
  region        = "asia-southeast1"
  network       = google_compute_network.main.id
}

resource "google_compute_subnetwork" "public_asia_southeast1_b" {
  name          = "dev-public-subnet-b"
  ip_cidr_range = "10.0.96.0/19"
  region        = "asia-southeast1"
  network       = google_compute_network.main.id
}