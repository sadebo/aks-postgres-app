variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-aks-postgres"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "aks_cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-postgres-cluster"
}

variable "acr_name" {
  description = "Azure Container Registry name (must be unique)"
  type        = string
  default     = "myaksacr01"
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 2
}

variable "node_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_B2s"
}
