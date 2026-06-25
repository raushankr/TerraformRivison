data "azurerm_virtual_network" "v1" {
    for_each = var.perring
  name                = each.value.virtual_network_name1
  resource_group_name = var.rg_name
}

data "azurerm_virtual_network" "v2" {
     for_each = var.perring
  name                = each.value.virtual_network_name2
  resource_group_name = var.rg_name
  }
