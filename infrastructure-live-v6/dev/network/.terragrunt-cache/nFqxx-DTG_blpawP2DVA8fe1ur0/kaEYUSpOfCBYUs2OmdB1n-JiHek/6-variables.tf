variable "env" {
  description = "Environment name."
  type        = string
}

variable "private_subnets" {
  description = "CIDR (Classless Inter-Domain Routing)."
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR (Classless Inter-Domain Routing)."
  type        = list(string)
}

variable "k8s_pod_range" {
  description = "k8s_pod_range."
  type        = list(string)
}

variable "k8s_service_range" {
  description = "k8s_service_range."
  type        = list(string)
}

variable "region" {
  description = "Region."
  type        = string
  default = "asia-southeast1"
}