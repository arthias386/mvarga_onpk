output "subnet_user" {
  value = azurerm_subnet.system.id
}

output "subnet_system" {
  value = azurerm_subnet.user.id
}