resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-postgres"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-postgres-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-postgres"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s" # Free tier friendly
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
