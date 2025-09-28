# Resource Group for AKS + ACR
resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-postgres"
  location = var.location
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-postgres-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-postgres"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s" # cost-effective for free tier
  }

  identity {
    type = "SystemAssigned"
  }
}

# Azure Container Registry (static name, must be globally unique + lowercase)
resource "azurerm_container_registry" "acr" {
  name                = "myaksacr01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Assign AKS permission to pull images from ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}
