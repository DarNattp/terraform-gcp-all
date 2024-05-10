remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    path = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "google" {
  credentials = "../../../../../../../../terraform-credentials.json"
  project     = "devops-00000"
  region      = "asia-southeast1"
}
provider "google-beta" {
  credentials = "../../../../../../../../terraform-credentials.json"
  project = "devops-00000"
  region  = "asia-southeast1"
}
EOF
}