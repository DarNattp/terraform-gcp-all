terraform {
  source = "../../../modules/gke"
}

include root {
  path = find_in_parent_folders()
}

inputs = {
  env              = "dev"
  network          = dependency.network.outputs.network_id
  subnet_ids       = dependency.network.outputs.private_subnet_ids

  # nodes
  machineType      = "e2-highmem-2"
  minNode          = 0
  maxNode          = 4
}

dependency "network" {
  config_path = "../network"

  mock_outputs = {
    private_subnet_ids = ["subnet-1234", "subnet-5678"]
  }
}