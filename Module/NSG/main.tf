resource "azurerm_network_security_group" "tf-nsg" {
    for_each = var.nsgs
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "tf-association" {
  for_each = var.nsgs
  subnet_id                 = data.azurerm_subnet.tf-subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.tf-nsg[each.key].id
}