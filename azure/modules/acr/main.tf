# --- azure_final/modules/acr/main.tf ---

module "container_registry" {
  source  = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "0.3.1"
  name      = "mvargaonpkacr"
  resource_group_name = var.resource_group_name
  sku      = var.tier
  location  = var.location
  zone_redundancy_enabled = false
}