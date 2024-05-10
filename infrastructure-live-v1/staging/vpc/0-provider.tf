# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  credentials = "../../../terraform-credentials.json"
  project = "devops-00000"
  region  = "asia-southeast1"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  required_version = ">= 1.0"
  # backend "gcs" {
  #   bucket = "todo-tf-state-staging-1"
  #   prefix = "terraform/state"
  # }
  backend "local" {
    path = "staging/vpc/terraform.tfstate"
  }  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.27.0"
    }
  }
}  