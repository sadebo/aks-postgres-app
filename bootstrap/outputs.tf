output "resource_group_name" {
  description = "Resource group where the remote state is stored"
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "Storage account used for Terraform state"
  value       = azurerm_storage_account.tfstate.name
}

output "container_name" {
  description = "Blob container used for Terraform state"
  value       = azurerm_storage_container.tfstate.name
}
