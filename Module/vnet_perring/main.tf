resource "azurerm_virtual_network_peering" "vnet_perring1" {
    for_each = var.perring
  name                      = each.value.vnet_peeriing_name1
  resource_group_name       = var.rg_name
  virtual_network_name      = each.value.virtual_network_name1
  remote_virtual_network_id = data.azurerm_virtual_network.v1[each.key].id
}

resource "azurerm_virtual_network_peering" "vnet_perring2" {
    for_each = var.perring
  name                      = each.value.vnet_peeriing_name2
  resource_group_name       = var.rg_name
  virtual_network_name      = each.value.virtual_network_name2
  remote_virtual_network_id = data.azurerm_virtual_network.v2[each.key].id
}

