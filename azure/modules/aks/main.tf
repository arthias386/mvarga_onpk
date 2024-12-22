# --- azure_final/modules/aks/main.tf ---

resource "azurerm_kubernetes_cluster" "system_pool" {
  name                = "mvarga_onpk_system_pool"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "system"


  default_node_pool {
    name           = "system"
    vm_size        = var.node_vm_size
    node_count     = var.system_node_count
    vnet_subnet_id = var.system_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "mvarga_onpk_system_pool"
  }
}

resource "azurerm_kubernetes_cluster" "user_pool" {
  name                = "mvarga_onpk_user_pool"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "user"

  default_node_pool {
    name           = "user"
    vm_size        = var.node_vm_size
    node_count     = var.user_node_count
    vnet_subnet_id = var.user_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "mvarga_onpk_user_pool"
  }
}