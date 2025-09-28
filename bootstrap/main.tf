resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "tfstate" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "terraform-backend"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

# Assign GitHub Actions Service Principal access to blob data
resource "azurerm_role_assignment" "sp_blob_data_contrib" {
  principal_id         = var.sp_object_id
  role_definition_name = "Storage Blob Data Contributor"
  scope                = azurerm_storage_account.tfstate.id
}
