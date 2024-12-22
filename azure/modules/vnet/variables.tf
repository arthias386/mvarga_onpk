# --- azure_final/modules/vnet/variables.tf ---

variable "resource_group_name" {
  description = "Názov resource groupy"
  type        = string  
}

variable "cidr_block" {
  description = "CIDR block for the VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "location" {
  description = ""
  type        = string
  default     = "West Europe"
}