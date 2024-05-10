# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "this" {
  name       = "${var.env}-pool"
  location   = "asia-southeast1"
  cluster    = google_container_cluster.this.id
  node_count = 1
  node_locations = ["asia-southeast1-b", "asia-southeast1-c"]

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = var.minNode
    max_node_count = var.maxNode
  }

  timeouts {
    create = "60m"
    update = "60m"
  }

  node_config {
    preemptible  = false
    machine_type = var.machineType
    disk_size_gb = 100
    disk_type    = "pd-standard"

    image_type = "COS_CONTAINERD"

    labels = {
      role = "general"
      node-architecture = "amd64"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
