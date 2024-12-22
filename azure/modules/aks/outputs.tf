output "cluster_name" {
  description = "Názov AKS clusteru"
  value       = azurerm_kubernetes_cluster.system_pool.name
}

output "fqdn" {
  description = "FQDN pre AKS cluster"
  value       = azurerm_kubernetes_cluster.system_pool.fqdn
}

output "system_pool_name" {
  description = "Názov systémového node poolu"
  value       = azurerm_kubernetes_cluster.system_pool.default_node_pool[0].name
}
