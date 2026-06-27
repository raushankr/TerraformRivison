data "azurerm_subnet" "tf-subnet" {
    for_each = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = var.rg_name
}