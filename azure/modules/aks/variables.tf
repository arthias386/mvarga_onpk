# --- azure_final/modules/aks/variables.tf ---

variable "node_vm_size" {
  description = "Veľkosť VM pre uzly"
  type        = string
  default     = "Standard_B2ms"
}

variable "system_node_count" {
  description = "Počet systémových uzlov"
  type        = number
  default     = 1
}

variable "user_node_count" {
  description = "Počet užívateľských uzlov"
  type        = number
  default     = 1
}

variable "user_subnet_id" {
  description = ""
  type        = string
}

variable "system_subnet_id" {
  description = ""
  type        = string
}

variable "location" {
  description = "Lokalita pre AKS cluster"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Názov Resource Group pre AKS"
  type        = string
}

