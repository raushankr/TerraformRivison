resource "azurerm_container_registry" "tf-acr" {
    for_each = var.acr
  name                = each.value.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
}