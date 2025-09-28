output "resource_group_name" {
  description = "Resource group for AKS and ACR"
  value       = azurerm_resource_group.rg.name
}

output "aks_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "acr_name" {
  description = "Container registry name"
  value       = azurerm_container_registry.acr.name
}

output "kube_config" {
  description = "Kubeconfig for connecting to AKS"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}
