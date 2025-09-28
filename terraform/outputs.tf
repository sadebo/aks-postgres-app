output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "argocd_namespace" {
  value = kubernetes_namespace.argocd.metadata[0].name
}
