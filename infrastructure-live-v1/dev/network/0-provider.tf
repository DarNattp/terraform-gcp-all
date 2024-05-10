# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  credentials = "../../../terraform-credentials.json"
  project = "devops-00000"
  region  = "asia-southeast1"
}

terraform {
  required_version = ">= 1.0"
  backend "local" {
    path = "dev/network/terraform.tfstate"
  }  
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.27.0"
    }
  }
}