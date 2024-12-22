# --- azure_final/variables.tf ---

variable "resource_group_name" {
  description = "Názov Resource Group"
  type        = string
  default     = "mvarga_onpk_rg" 
}

variable "location" {
  description = "Lokalita Azure"
  type        = string
  default     = "West Europe" 
}

variable "environment" {
  description = "Názov prostredia"
  type        = string
  default     = "mvarga_onpk_development"
}

variable "subscription_id" {
  description = ""
  type        = string
  default     = "f78f56ef-9c88-4dea-9fed-22b3e294adf4"
}

variable "tenant_id" {
  description = ""
  type        = string
  default     = "72ed8d00-e7ac-4665-acc2-410a9efd7a68"
}

variable "aks_node_vm_size" {
  description = ""
  type        = string
  default     = "Standard_B2as_V2"
}

variable "acr_tier" {
  description = "Tier for Azure Container Registry"
  type = string
  default = "Standard"
}

variable "aks_system_node_count" {
  description = "Number of system pool nodes"
  type = number
  default = 1
}

variable "aks_user_node_count" {
  description = "Number of user pool nodes"
  type = number
  default = 1
}

variable "cidr_block" {
  description = "CIDR block for the VNet"
  type = string
  default = "10.0.0.0/16"
}