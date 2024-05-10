terraform {
  source = "github.com/terraform-google-modules/terraform-google-network//modules/vpc?ref=v9.1.0"
}

include {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  project_id   = include.env.locals.project_id
  network_name = "${include.env.locals.env}-vpc"

  subnets = [
    {
      subnet_name   = "${include.env.locals.env}-private-subnet-1"
      subnet_ip     = "10.10.0.0/16"
      subnet_region = "asia-southeast1"
    },
  ]

  secondary_ranges = {
    "${include.env.locals.env}-private-subnet-1" = [
      {
        range_name    = "gke-pods-1"
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = "gke-services-1"
        ip_cidr_range = "10.30.0.0/16"
      },
    ]
  }
}