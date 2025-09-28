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
  description = "Globally unique storage account name for Terraform state"
  type        = string
  # Must be lowercase, 3–24 characters, unique across Azure
  default     = "mytfstateacct01"
}

variable "container_name" {
  description = "Blob container name for storing Terraform state files"
  type        = string
  default     = "tfstate"
}

variable "sp_object_id" {
  description = "Object ID of the Service Principal used by GitHub Actions"
  type        = string
}

# variable "subscription_id" {
#   description = "The Subscription ID to deploy resources into"
#   type        = string
  
# }