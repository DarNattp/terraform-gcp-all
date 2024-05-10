# # https://registry.terraform.io/providers/hashicorp/google/latest/docs
# provider "google" {
#   credentials = "../../../terraform-credentials.json"
#   project = "devops-00000"
#   region  = "asia-southeast1"
# }

# terraform {
#   required_version = ">= 1.0"
#   backend "local" {
#     path = "dev/network/terraform.tfstate"
#   }  
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 5.27.0"
#     }
#   }
# }

# module "network" {
#   source = "../../../modules/network"

#   env              = "dev"
#   region           = "asia-southeast1"
#   private_subnets  = ["10.0.0.0/19", "10.0.32.0/19"]
#   public_subnets   = ["10.0.64.0/19", "10.0.96.0/19"]
#   k8s_pod_range    = ["10.48.0.0/14", "10.64.0.0/14"]
#   k8s_service_range = ["10.52.0.0/20", "10.68.0.0/20"]
# }
