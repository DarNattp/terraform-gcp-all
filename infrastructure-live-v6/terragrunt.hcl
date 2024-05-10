remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "natapat-terraform-state"
    credentials = "/Users/darvel/git/labs/darnattp/terraform-gcp/terraform-credentials.json"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "google" {
  credentials = "../../../../../../terraform-credentials.json"
  project = "devops-00000"
  region  = "asia-southeast1"
}
EOF
}