resource "azurerm_resource_group" "tf-rg" {
for_each = var.rgs
  name     = each.value.rg_name
  location = each.value.location

  tags = {
    environment = each.value.tags
  }
}