output "acr_name" {
  description = "Názov Azure Container Registry"
  value       = module.acr.name
}

output "aks_cluster_name" {
  description = "Názov AKS clusteru"
  value       = module.aks.cluster_name
}

output "aks_fqdn" {
  description = "FQDN pre AKS cluster"
  value       = module.aks.fqdn
}