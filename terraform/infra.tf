###############################################
# Resource Group
###############################################
resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-postgres"
  location = "eastus"

  tags = {
    environment = "dev"
  }
}

###############################################
# Azure Container Registry (ACR)
###############################################
resource "azurerm_container_registry" "acr" {
  name                = "parallelacr987601" # hardcoded ACR name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = {
    environment = "dev"
  }
}

###############################################
# Azure Kubernetes Service (AKS)
###############################################
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-postgres-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-postgres"

  # ✅ optimized for free-tier credits
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s" # 2 vCPUs, 4GB RAM
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }
}
