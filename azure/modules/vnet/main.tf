# --- azure_final/modules/vnet/main.tf ---

resource "azurerm_virtual_network" "main" {
  name                = "mvarga_onpk_vnet"
  address_space       = [var.cidr_block]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "system" {
  name                 = "mvarga_onpk_system_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "user" {
  name                 = "mvarga_onpk_usersubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "main" {
  name                = "mvarag_onpk_nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSHfromWorld"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_route_table" "main" {
  name                = "mvarga_onpk_route_table"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_route_table_association" "system" {
  subnet_id      = azurerm_subnet.system.id
  route_table_id = azurerm_route_table.main.id
}

resource "azurerm_subnet_route_table_association" "user" {
  subnet_id      = azurerm_subnet.user.id
  route_table_id = azurerm_route_table.main.id
}

resource "azurerm_subnet_network_security_group_association" "system" {
  subnet_id                 = azurerm_subnet.system.id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_subnet_network_security_group_association" "user" {
  subnet_id                 = azurerm_subnet.user.id
  network_security_group_id = azurerm_network_security_group.main.id
}