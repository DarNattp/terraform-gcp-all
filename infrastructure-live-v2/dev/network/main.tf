provider "google" {
  credentials = "../../../terraform-credentials.json"
  project = var.project_id
  region  = "asia-southeast1"
}

provider "google-beta" {
  credentials = "../../../terraform-credentials.json"
  project = var.project_id
  region  = "asia-southeast1"
}

terraform {
  required_version = ">= 1.0"
  # backend "gcs" {
  #   bucket = "todo-tf-state-staging-1"
  #   prefix = "terraform/state"
  # }
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

/******************************************
	VPC configuration
 *****************************************/
module "vpc" {
  source                                    = "../../../modules/network/vpc"
  network_name                              = var.network_name
  auto_create_subnetworks                   = var.auto_create_subnetworks
  routing_mode                              = var.routing_mode
  project_id                                = var.project_id
  description                               = var.description
  shared_vpc_host                           = var.shared_vpc_host
  delete_default_internet_gateway_routes    = var.delete_default_internet_gateway_routes
  mtu                                       = var.mtu
  enable_ipv6_ula                           = var.enable_ipv6_ula
  internal_ipv6_range                       = var.internal_ipv6_range
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order
}

/******************************************
	Subnet configuration
 *****************************************/
module "subnets" {
  source           = "../../../modules/network/subnets"
  project_id       = var.project_id
  network_name     = module.vpc.network_name
  subnets          = var.subnets
  secondary_ranges = var.secondary_ranges
}