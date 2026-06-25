data "azurerm_public_ip" "tf-pip" {
  for_each            = var.nat
  name                = each.value.pip_name
  resource_group_name = var.rg_name
}
data "azurerm_subnet" "tf-subnet" {
    for_each = var.nat
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = var.rg_name
}