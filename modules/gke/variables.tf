variable "subnet_ids" {
  description = "List of subnet IDs for the GKE cluster. Must be in at least two different availability zones."
  type        = list(string)
}

variable "env" {
  description = "Environment name."
  type        = string
}

variable "region" {
  description = "Region."
  type        = string
  default = "asia-southeast1"
}

variable "network" {
  description = "Network."
  type        = string
}

variable "minNode" {
  description = "Minimum Node Count"
}

variable "maxNode" {
  description = "maximum Node Count"
}

variable "machineType" {
  description = "Node Instance machine type"
}
