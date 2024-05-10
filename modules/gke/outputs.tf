output "email" {
  value = google_service_account.kubernetes.email
}

output "cluster_endpoint" {
  value = google_container_cluster.this.endpoint
}