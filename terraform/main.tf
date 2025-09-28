resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-postgres"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "parallelacr987601"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-postgres-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-postgres"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B4ms"
  }

  identity {
    type = "SystemAssigned"
  }
}
