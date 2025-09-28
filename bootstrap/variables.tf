variable "rg_name" {
  description = "Resource group for Terraform remote state"
  type        = string
  default     = "rg-terraform-state"
}

variable "location" {
  description = "Azure region for the state storage"
  type        = string
  default     = "eastus"
}

variable "storage_account_name" {
  description = "Globally unique storage account name (3–24 lowercase letters/numbers)"
  type        = string
  default     = "mytfstateacct01"
}

variable "container_name" {
  description = "Blob container name for storing Terraform state files"
  type        = string
  default     = "tfstate"
}

