# --- azure_final/modules/acr/variables.tf ---

variable "tier" {
  description = "Úroveň pre ACR (napr. Basic, Standard, Premium)"
  type        = string
}

variable "location" {
  description = "Lokalita pre Azure Container Registry"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Názov resource groupy"
  type        = string  
}