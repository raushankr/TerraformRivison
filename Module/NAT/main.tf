resource "azurerm_nat_gateway" "nat" {
    for_each = var.nat
  name                    = each.value.nat_name
  location                = var.location
  resource_group_name     = var.rg_name
  sku_name                = each.value.sku_name
  
}

resource "azurerm_nat_gateway_public_ip_association" "pip_association" {
    for_each = var.nat
  nat_gateway_id       = azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = data.azurerm_public_ip.tf-pip[each.key].id
}
resource "azurerm_subnet_nat_gateway_association" "nat_subnet_asso" {
    for_each = var.nat
  subnet_id      = data.azurerm_subnet.tf-subnet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat[each.key].id
}