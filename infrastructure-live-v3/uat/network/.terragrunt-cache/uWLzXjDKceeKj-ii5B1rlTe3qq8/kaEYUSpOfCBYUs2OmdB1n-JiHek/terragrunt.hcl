terraform {
  source = "../../../modules/network"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  
  # vpc.tfvars
  network_name        = "uat-vpc"
  project_id          = "devops-00000"
  description         = "My UAT VPC network"
  auto_create_subnetworks = false
  routing_mode        = "REGIONAL"
  shared_vpc_host     = false
  delete_default_internet_gateway_routes = false
  mtu                 = 1460
  enable_ipv6_ula     = false
  internal_ipv6_range = null
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"

  # subnets.tfvars
  subnets = [
    {
      subnet_name           = "uat-private-subnet-1"
      subnet_ip             = "10.0.128.0/19"
      subnet_region         = "asia-southeast1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
      description           = "Private subnet 1"
      purpose               = "PRIVATE"
    },
    {
      subnet_name           = "uat-private-subnet-2"
      subnet_ip             = "10.0.160.0/19"
      subnet_region         = "asia-southeast1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
      description           = "Private subnet 2"
      purpose               = "PRIVATE"
    },
    {
      subnet_name           = "uat-public-subnet-1"
      subnet_ip             = "10.0.192.0/19"
      subnet_region         = "asia-southeast1"
      subnet_private_access = "false"
      subnet_flow_logs      = "true"
      description           = "Public subnet 1"
    },
    {
      subnet_name           = "uat-public-subnet-2"
      subnet_ip             = "10.0.224.0/19"
      subnet_region         = "asia-southeast1"
      subnet_private_access = "false"
      subnet_flow_logs      = "true"
      description           = "Public subnet 2"
    }
  ]

  secondary_ranges = {
    uat-private-subnet-1 = [
      {
        range_name    = "gke-pods-1"
        ip_cidr_range = "10.68.0.0/14"
      },
      {
        range_name    = "gke-services-1"
        ip_cidr_range = "10.84.0.0/20"
      }
    ]

    uat-private-subnet-2 = [
      {
        range_name    = "gke-pods-2"
        ip_cidr_range = "10.72.0.0/14"
      },
      {
        range_name    = "gke-services-2"
        ip_cidr_range = "10.100.0.0/20"
      }
    ]
  }
}
