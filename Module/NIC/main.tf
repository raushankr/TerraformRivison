resource "azurerm_network_interface" "tf-nic" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name                          = ip_configuration.value.ip_name
      subnet_id                     = data.azurerm_subnet.tf-subnet[each.key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address
    }

  }
}
