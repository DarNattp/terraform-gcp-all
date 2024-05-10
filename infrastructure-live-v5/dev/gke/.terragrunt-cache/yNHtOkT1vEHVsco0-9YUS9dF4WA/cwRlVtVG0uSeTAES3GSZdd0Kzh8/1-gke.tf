# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "this" {

  name                     = "${var.env}-gke-cluster"
  location                 = "asia-southeast1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.network
  subnetwork               = var.subnet_ids[0]
  logging_service          = "none"
  monitoring_service       = "none"
  networking_mode          = "VPC_NATIVE"
  enable_shielded_nodes    = "true"

  # Optional, if you want multi-zonal cluster
  # node_locations = [
  #   # "asia-southeast1-b",
  #   "asia-southeast1-a"
  # ]

  node_config {
    # preemptible  = true
    # machine_type = "e2-medium"
    disk_type    = "pd-standard"

    # service_account = google_service_account.default.email
    # oauth_scopes    = [
    #   "https://www.googleapis.com/auth/cloud-platform"
    # ]
  }

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "STABLE"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  # monitoring_config {
  #   enable_components = []
  # }

  # logging_config {
  #   enable_components = []
  # }
  #   Jenkins use case
  #   master_authorized_networks_config {
  #     cidr_blocks {
  #       cidr_block   = "10.0.0.0/18"
  #       display_name = "private-subnet-w-jenkins"
  #     }
  #   }
}