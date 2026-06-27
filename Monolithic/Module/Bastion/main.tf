resource "azurerm_bastion_host" "tf-bastion" {
    for_each = var.bastions
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic ip_configuration {
    for_each = each.value.ip_config
    content {
          name                 = ip_configuration.value.ip_name
    subnet_id            = data.azurerm_subnet.tf-subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.tf-pip[each.key].id
    }
  }
}