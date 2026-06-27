data "azurerm_public_ip" "tf-lbpip" {
  for_each            = var.lbs
  name                = each.value.pip_name
  resource_group_name = var.rg_name
}

data "azurerm_network_interface" "tf-nic" {
  for_each = var.lbs
  name                = each.value.nic_name
  resource_group_name = var.rg_name
}